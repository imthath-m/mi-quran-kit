//
//  File.swift
//  
//
//  Created by Imthath on 07/06/21.
//

import Foundation
import MINetworkKit

extension QuranStore {
  public static func search(keyword: String) -> [VerseSource] {
    if keyword.contains("-") {
     return getSources(from: keyword.split(separator: "-"))
    }

    if keyword.contains("to") {
      return getSources(from: keyword.components(separatedBy: "to").map { Substring($0) })
    }

    return getSources(from: Substring(keyword))
  }

  private static func getSources(from parts: [String.SubSequence]) -> [VerseSource] {
    guard parts.count == 2 else {
      if parts.count == 1 {
        return getSources(from: parts.first)
      }
      return []
    }

    let startingVerses = getVerses(from: parts.first)

    guard !startingVerses.isEmpty else {
      return []
    }

    let sameSurah = startingVerses.compactMap { surah, ayah -> VerseSource? in
      let startAyah = ayah ?? 1
      if let endAyah = getAyahNumber(inSurah: surah, from: parts.last),
         endAyah >= startAyah {
        return VerseSource.range(.init(startSurah: surah, startAyah: startAyah, endSurah: surah, endAyah: endAyah))
      }

      return nil
    }


    let endingVerses = getVerses(from: parts.last)

    guard !endingVerses.isEmpty else {
      return sameSurah + startingVerses.map { .fullSurah($0.0) }
    }

    let result = startingVerses
      .map { firstVerse -> [VerseSource] in
        let firstAyah: Int16 = firstVerse.1 ?? 1

        return endingVerses
          .compactMap { secondVerse -> VerseSource? in
            if secondVerse.0 < firstVerse.0 {
              return nil
            }

            let secondAyah: Int16 = secondVerse.1 ?? Int16(verses(in: secondVerse.0).count)

            if secondVerse.0 == firstVerse.0,
               firstAyah < secondAyah {
              return nil
            }

            return .range(.init(startSurah: firstVerse.0, startAyah: firstAyah,
                                endSurah: secondVerse.0, endAyah: secondAyah))
          }
      }
      .flatMap { $0 }

    return sameSurah + result
  }

  private static func getSources(from subString: String.SubSequence?) -> [VerseSource] {
    getVerses(from: subString)
      .flatMap { verse -> [VerseSource] in
        let surah = verse.0

        if let ayah = verse.1 {
          var result = [VerseSource.range(.init(startSurah: surah, startAyah: ayah, endSurah: surah, endAyah: ayah))]
          let lastAyah = verses(in: surah).count
          if ayah < lastAyah {
            // so if user enter fajr:10, we'll add Al Fajr:10-30 also as a result.
            result.append(.range(.init(startSurah: surah, startAyah: ayah, endSurah: surah, endAyah: Int16(lastAyah))))
          }
          return result
        }

        return [VerseSource.fullSurah(surah)]
      }
  }

  private static func getVerses(from subString: String.SubSequence?) -> [(Int16, Int16?)] {
    guard let string = subString else {
      return []
    }

    if string.contains(":") {
      return getSurahAndAyahNumber(from: string.split(separator: ":"))
    } else {
      let parts = string.trimmingCharacters(in: .whitespacesAndNewlines).split(separator: " ")
      if parts.count > 1,
         let lastPart = parts.last,
         let ayah = Int16(lastPart) {

        // it would work perfectly without the if condtion, as the else condition also handles when you have only one word
        // before the ayah number, but the else condition performs a lot of operations and mutations
        // which can be avoided when we know that the count it two
        if parts.count == 2 {
          return getSurahNumbers(from: parts.first).map { ($0, ayah) }
        } else {
          let surahString = parts.dropLast().joined(separator: " ")
          return getSurahNumbers(from: Substring(surahString)).map { ($0, ayah) }
        }
      }
    }

    return getSurahNumbers(from: subString).map { ($0, nil) }
  }

  private static func getSurahAndAyahNumber(from parts: [String.SubSequence]) -> [(Int16, Int16?)] {
    guard parts.count == 2 else {
      if parts.count == 1 {
        return getSurahNumbers(from: parts.first).map { ($0, nil) }
      }
      return []
    }

    return getSurahNumbers(from: parts.first)
      .map { ($0, getAyahNumber(inSurah: $0, from: parts.last)) }
  }

  private static func getSurahNumbers(from subString: String.SubSequence?) -> [Int16] {
    guard let string = subString?.trimmingCharacters(in: .whitespacesAndNewlines) else {
      return []
    }

    if let surah = Int16(string),
       surah > 0,
       surah <= 114 {
      return [surah]
    }

    let surahs = english.enumerated().compactMap { (index, name) -> Int16? in
      if name.localizedCaseInsensitiveContains(string) {
        return Int16(index+1)
      }

      return nil
    }

    if !surahs.isEmpty {
      return surahs
    }

    return arabic.enumerated().compactMap { (index, name) -> Int16? in
      if name.localizedCaseInsensitiveContains(string) {
        return Int16(index+1)
      }

      return nil
    }
  }

  private static func getAyahNumber(inSurah surah: Int16, from subString: String.SubSequence?) -> Int16? {
    guard let last = subString?.trimmingCharacters(in: .whitespacesAndNewlines),
          let ayah = Int16(last),
          ayah > 0,
          ayah <= verses(in: surah).count else {
      return nil
    }

    return ayah
  }
}
