//
//  SwiftUIView.swift
//  
//
//  Created by Imthath on 01/08/21.
//

import SwiftUI

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
