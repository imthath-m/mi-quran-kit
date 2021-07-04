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
    audio.player.pause()
    audio.player.removeAllItems()
  }

  public static func pauseAudio() {
    audio.player.pause()
  }

  private static var audio: AudioService { .shared }

  public static func isPlaying(_ source: VerseSource?) -> Bool {
    guard let source = source, let current = shared.currentSource else { return false }
    return source.uniqueID == current.uniqueID
  }

  public static func playAudio(for source: VerseSource, reciterID: String, repeats repeatCount: Int = 7) {
//    for verse in verses(from: source) {
//      AudioService.shared.fetchAudioOfReciter(withID: reciterID, for: verse)
//    }

    let verses = QuranStore.verses(from: source)

    guard let firstVerse = verses.first else { return }
    let count = verses.count

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

      guard shared.currentSource != source else {
        // resumes current audio
        audio.player.play()
        return
      }

      audio.player.removeAllItems()
      audio.activateSesssion(true)

      shared.currentSource = source
      for _ in 1...repeatCount {
        if firstVerse.insertBismiBefore {
          play(baseURL: firstPart, reciterID: reciterID, ayah: 1)
        }
        for ayah in firstAyah...lastAyah {
          play(baseURL: firstPart, reciterID: reciterID, ayah: ayah)
        }
      }
    }
  }

  private static func play(baseURL: String, reciterID: String, ayah: Int) {
    let urlString = baseURL + reciterID + "/\(ayah).mp3"
    guard let newURL = URL(string: urlString) else { return }
    audio.play(url: newURL)
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

public extension View {
  func reciterPicer(isPresented: Binding<Bool>, selected: Binding<Set<CDReciter>>) -> some View {
    modifier(ReciterPickerModifier(isPresented: isPresented, reciters: selected))
  }
}

struct ReciterPickerModifier: ViewModifier {

  @Binding var isPresented: Bool
  @Binding var reciters: Set<CDReciter>

  func body(content: Content) -> some View {
    content
      .sheet(isPresented: $isPresented, onDismiss: nil, content: {
        ReciterPicker(selectedReciters: $reciters)
          .environment(\.managedObjectContext, QuranStore.context)
      })
  }
}

public extension CDReciter {
  var arabicName: String { arName ?? "" }
  var englishName: String { enName ?? "" }
  var id: String { identifier ?? "" }
  var language: QuranStore.Language {
    guard let lang = lang,
            let result = QuranStore.Language(rawValue: lang) else {
      return .arabic
    }

    return result
  }
}

struct ReciterPicker: View {
  @Environment(\.presentationMode) var presentationMode

  @FetchRequest(
    entity: CDReciter.entity(),
    sortDescriptors: [NSSortDescriptor(key: "enName", ascending: true)],
    predicate: nil,
    animation: nil
  )
  var reciters: FetchedResults<CDReciter>

  @Binding var selectedReciters: Set<CDReciter>

  public init(selectedReciters: Binding<Set<CDReciter>>) {
    _selectedReciters = selectedReciters
  }

  public var body: some View {
    NavigationView {
      List(reciters) { reciter in
        row(for: reciter)
      }
      .navigationBarTitle(Text("Select Reciters"))
      .navigationBarItems(trailing: Button("Done", action: {
        presentationMode.wrappedValue.dismiss()
      }))
    }
  }

  func row(for reciter: CDReciter) -> some View {
    HStack {
      VStack(alignment: .leading) {
        Text(reciter.englishName)
        Text(reciter.arabicName)
//          .font(.footnote)
          .foregroundColor(.secondary)
      }

      Spacer()

      Image(systemName: reciter.isEnabled ? "checkmark.circle.fill" : "circle")
        .imageScale(.large)
    }
    .contentShape(Rectangle())
    .onTapGesture {
      reciter.isEnabled.toggle()
//      if !selectedReciters.insert(reciter).inserted {
//        selectedReciters.remove(reciter)
//      }
    }
  }
}
