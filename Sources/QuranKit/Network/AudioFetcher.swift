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
