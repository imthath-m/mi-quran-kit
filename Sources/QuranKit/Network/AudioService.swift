//
//  File.swift
//  
//
//  Created by Imthath on 01/08/21.
//

import AVFoundation
import SwiftUI

class AudioService {
  public static let shared: AudioService = .init()
  private static let audioPlayerThread = DispatchQueue.global(qos: .background)

  public var player: AVQueuePlayer = AVQueuePlayer(items: [])
  private lazy var subscriptions = Set<AnyHashable>()
  private lazy var getVerseAudioMeta = GetAudioData<AudioMeta>()
  private lazy var getReciters = GetAudioData<[Reciter]>()
  @AppStorage("fetched17reciters") private var fetched17reciters: Bool = false

  private init() {
    initSesssion()
  }

  private func initSesssion() {
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

  func fetchVerseByVerseReciters(inLang language: String = "ar") {
    // this check is to ensure we don't make unwanted requests unless the API adds a new arabic reciter
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
        QuranAudio.saveReciters(response.data)
      case .failure(let error):
        print(error.localizedDescription)
      }
    }
  }

  func fetchAudioURLOfReciter(withID reciterID: String, for verse: CDVerse, onCompletion handler: @escaping (String) -> Void) {
    guard !reciterID.isEmpty else { return }

    let request = AudioRequest.audioURL(reciterID: reciterID, surah: verse.surah, ayah: verse.ayah)
    getVerseAudioMeta.execute(request) { result in
      switch result {
      case .success(let response):
        handler(response.data.audio)
      case .failure(let error):
        print(error.localizedDescription)
        handler("")
      }
    }
  }

  func play(url: URL, observeItem: Bool = false) {
    Self.audioPlayerThread.sync {
      let playerItem = AVPlayerItem(url: url)
      if observeItem {
        NotificationCenter.default.addObserver(self, selector: #selector(finishedPlaying), name: .AVPlayerItemDidPlayToEndTime, object: playerItem)
      }
      player.insert(playerItem, after: nil)
      player.play()
    }
  }

  @objc func finishedPlaying() {
    QuranAudio.repeatIfReuired()
  }
}
