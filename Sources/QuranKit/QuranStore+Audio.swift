//
//  File.swift
//  
//
//  Created by Imthath on 20/06/21.
//

import Foundation
import SwiftUI
import CoreData

extension QuranStore {
  public static func availableReciters(language: QuranStore.Language = .english) -> [CDReciter] {
    let fetchRequest: NSFetchRequest<CDReciter> = CDReciter.fetchRequest()
    do {
      return try context.fetch(fetchRequest)
    } catch {
      assertionFailure(error.localizedDescription)
      return []
    }
  }

  public static func playAudio(for source: VerseSource, reciterID: String) {
//    for verse in verses(from: source) {
//      AudioService.shared.fetchAudioOfReciter(withID: reciterID, for: verse)
//    }

    let verses = verses(from: source)

    guard let firstVerse = verses.first else { return }
    let count = verses.count

    AudioService.shared.fetchAudioURLOfReciter(withID: reciterID, for: firstVerse) { urlString in
      guard !urlString.isEmpty,
            let url = URL(string: urlString),
            let lastPath = url.pathComponents.last?.split(separator: ".").first,
            let number = Int(lastPath) else {
              return
            }

      let lastVerse = number + count
      let parts = urlString.components(separatedBy: reciterID)

      guard let firstPart = parts.first else {
        return
      }

      for ayah in number...lastVerse {
        let newString = firstPart + reciterID + "/\(ayah).mp3"
        guard let newURL = URL(string: newString) else { return }
        AudioService.shared.play(url: newURL)
      }
    }
  }

  internal static func saveReciters(_ reciters: [Reciter]) {
    for reciter in reciters {
      guard !reciter.identifier.isEmpty else { continue }
      let result = CDReciter(context: context)
      result.identifier = reciter.identifier
      result.arName = reciter.arabicName
      result.enName = reciter.englishName
      result.lang = reciter.language
      result.isEnabled = reciter.identifier == "" ? true : false
    }

    save()
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
