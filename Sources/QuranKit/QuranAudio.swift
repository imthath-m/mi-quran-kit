//
//  File.swift
//  
//
//  Created by Imthath on 20/06/21.
//

import Foundation
import SwiftUI
import CoreData
import AVFoundation

public extension Hashable {
  func store(in set: inout Set<AnyHashable>) {
    _ = set.insert(self)
  }
}

extension VerseSource: Equatable {
  public static func == (lhs: VerseSource, rhs: VerseSource) -> Bool {
    lhs.uniqueID == rhs.uniqueID
  }

  public var uniqueID: String {
    switch self {
    case .fullSurah(let surah): return "fullSurah_\(surah)"
    case .range(let range): return "range_\(range.startSurah):\(range.startAyah)-\(range.endSurah):\(range.endAyah)"
    }
  }
}

public class QuranAudio: ObservableObject {
  private init() { }

  public static let shared: QuranAudio = .init()

  var currentSource: VerseSource?

  var audioPlayer: AVQueuePlayer { AudioService.shared.player }

  @Published
  public var isPlaying: Bool = false

  public static func availableReciters(language: QuranStore.Language = .english) -> [CDReciter] {
    let fetchRequest: NSFetchRequest<CDReciter> = CDReciter.fetchRequest()
    do {
      return try QuranStore.context.fetch(fetchRequest)
    } catch {
      assertionFailure(error.localizedDescription)
      return []
    }
  }

  public static func stopAudio() {
    shared.isPlaying = false
    audio.player.pause()
    audio.player.removeAllItems()
    shared.currentSource = nil
    repeatCount = 0
    reciterID = ""
  }

  static var userPaused: Bool = false

  public static func pauseAudio() {
    shared.isPlaying = false
    audio.player.pause()
    userPaused = true
  }

  private static var audio: AudioService { .shared }

  public static func isPlaying(_ source: VerseSource?) -> Bool {
    guard let source = source, let current = shared.currentSource else { return false }
    return source.uniqueID == current.uniqueID
  }

  public static func playAudio(for source: VerseSource, reciterID: String, repeats repeatCount: Int = 2) {
    guard shared.currentSource != source else {
      // resumes current audio
      shared.isPlaying = true
      audio.player.play()
      userPaused = false
      return
    }

    shared.currentSource = source

    Self.reciterID = reciterID
    Self.repeatCount = repeatCount - 1
    _playAudio(for: source, reciterID: reciterID)
  }

  static var reciterID: String = ""
  static var repeatCount = 7

  static func repeatIfReuired() {
    guard !userPaused,
          let source = shared.currentSource,
          repeatCount > 0,
          !reciterID.isEmpty else {
      shared.isPlaying = false
      return
    }

    repeatCount -= 1
    _playAudio(for: source, reciterID: reciterID)
  }

  private static func _playAudio(for source: VerseSource, reciterID: String) {
    let verses = QuranStore.verses(from: source)
    guard let firstVerse = verses.first else { return }
    let count = verses.count
    shared.isPlaying = true

    audio.fetchAudioURLOfReciter(withID: reciterID, for: firstVerse) { urlString in
      guard !urlString.isEmpty,
            let url = URL(string: urlString),
            let lastPath = url.pathComponents.last?.split(separator: ".").first,
            let firstAyah = Int(lastPath) else {
              return
            }

      let lastAyah = firstAyah + count - 1
      let parts = urlString.components(separatedBy: reciterID)

      guard let firstPart = parts.first else {
        return
      }

      audio.player.removeAllItems()
      audio.activateSesssion(true)
      if firstVerse.insertBismiBefore {
        play(baseURL: firstPart, reciterID: reciterID, ayah: 1)
      }
      for ayah in firstAyah..<lastAyah {
        play(baseURL: firstPart, reciterID: reciterID, ayah: ayah)
      }
      play(baseURL: firstPart, reciterID: reciterID, ayah: lastAyah, observeItem: true)
    }
  }

  private static func play(baseURL: String, reciterID: String, ayah: Int, observeItem: Bool = false) {
    let urlString = baseURL + reciterID + "/\(ayah).mp3"
    guard let newURL = URL(string: urlString) else { return }
    audio.play(url: newURL, observeItem: observeItem)
  }

  internal static func saveReciters(_ reciters: [Reciter]) {
    for reciter in reciters {
      guard !reciter.identifier.isEmpty else { continue }
      let result = CDReciter(context: QuranStore.context)
      result.identifier = reciter.identifier
      result.arName = reciter.arabicName
      result.enName = reciter.englishName
      result.lang = reciter.language
      result.isEnabled = reciter.identifier == "" ? true : false
    }

    QuranStore.save()
  }
}

public extension CDVerse {
  var insertBismiBefore: Bool {
    ayah == 1 && surah != 1 && surah != 9
  }
}
