//
//  File.swift
//  
//
//  Created by Imthath on 20/06/21.
//

import Foundation
import MINetworkKit
import SwiftUI
import AVFoundation

struct PlainRequest: MIRequest {
  let urlString: String
  var method: MINetworkMethod = .get
  var params: [String: Any]? = nil
  var headers: [String: String]? = nil
  var body: Data? = nil
}

struct AudioRequest: MIRequest {
  var path: String
  var method: MINetworkMethod = .get
  var params: [String: Any]? = nil
  var headers: [String: String]? = nil
  var body: Data? = nil
}

extension AudioRequest {
  var baseURL: String { "https://api.alquran.cloud/v1/" }
  var urlString: String { baseURL + path }
}

extension AudioRequest {
  static func audioVersesMeta(language: String = "ar") -> Self {
    .init(path: "edition", params: ["format": "audio", "language": language, "type": "versebyverse"])
  }

  static func audioURL(reciterID: String, surah: Int16, ayah: Int16) -> Self {
    .init(path: "ayah/\(surah):\(ayah)/\(reciterID)")
  }
}

internal class AudioResponse<DataType: Codable>: Codable {

    var data: DataType

  internal init(data: DataType) { self.data = data }

}

class GetAudioData<T: Codable>: GetObject<AudioResponse<T>> { }

// MARK: - VerseMeta
struct Reciter: Codable {
    let identifier, language, arabicName, englishName: String
//    let format, type: String

  enum CodingKeys: String, CodingKey {
      case identifier, language
      case arabicName = "name"
      case englishName
//    case format, type
  }
}

struct AudioMeta: Codable {
  let audio: String
  let audioSecondary: [String]
}

class AudioService {
  private init() {
    initSesssion()
  }

  public static let shared: AudioService = .init()

  private lazy var getReciters = GetAudioData<[Reciter]>()
  @AppStorage("fetched17reciters") var fetched17reciters: Bool = false

  func fetchVerseByVerseReciters(inLang language: String = "ar") {
    // this check is to ensure we don't make unwanted requests unless the API adds a new arabic reciter
//    guard QuranStore.availableReciters().count < 17 else { return }
    guard !fetched17reciters else { return }

    // only 17 reciters avaialbe in Arabic and only 1 in English. So pagination is not required.
    // By default it returns 20 results, at max.
    let request: AudioRequest = .audioVersesMeta(language: language)
    getReciters.perform(request) { result in
      switch result {
      case .success(let response):
        if response.data.count >= 17 {
          self.fetched17reciters = true
        }
//        response.data.forEach { print($0)}
//        print(response.data)
        QuranStore.saveReciters(response.data)
      case .failure(let error):
        print(error.localizedDescription)
      }
    }
  }

  private lazy var getVerseAudioMeta = GetAudioData<AudioMeta>()

  func fetchAudioOfReciter(withID reciterID: String, for verse: CDVerse) {
    // check if verse is already stored locally
    guard !reciterID.isEmpty else { return }

    let request = AudioRequest.audioURL(reciterID: reciterID, surah: verse.surah, ayah: verse.ayah)
    getVerseAudioMeta.perform(request) { [weak self] result in
      switch result {
      case .success(let response):
        self?.downloadAudio(fromURL: response.data.audio)
      case .failure(let error):
        print(error.localizedDescription)
      }
    }
  }


  func fetchAudioURLOfReciter(withID reciterID: String, for verse: CDVerse, onCompletion handler: @escaping (String) -> Void) {
    // check if verse is already stored locally
    guard !reciterID.isEmpty else { return }

    let request = AudioRequest.audioURL(reciterID: reciterID, surah: verse.surah, ayah: verse.ayah)
    getVerseAudioMeta.perform(request) { result in
      switch result {
      case .success(let response):
//        self?.downloadAudio(fromURL: response.data.audio)
        handler(response.data.audio)
      case .failure(let error):
        print(error.localizedDescription)
        handler("")
      }
    }
  }

  private lazy var getData = GetData()

  func downloadAudio(fromURL urlString: String) {
    guard let url = URL(string: urlString) else { return }
    play(url: url)
//    getData.perform(PlainRequest(urlString: urlString)) { result in
//      switch result {
//      case .success(let data):
//        let audio = AVPlayer
//      }
//    }
  }

  var player: AVQueuePlayer = AVQueuePlayer(items: [])

  func play(url: URL) {
    print("playing \(url)")
    let playerItem = AVPlayerItem(url: url)
    player.insert(playerItem, after: nil)
    player.play()
  }

  func initSesssion() {
    do {
      try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default, options: [.defaultToSpeaker, .allowAirPlay])
      print("Playback OK")
    } catch {
      print(error)
    }
  }

  func activateSesssion(_ flag: Bool) {
    do {
      try AVAudioSession.sharedInstance().setActive(flag)
      print("Session is Active - \(flag)")
    } catch {
      print(error)
    }
  }
}
