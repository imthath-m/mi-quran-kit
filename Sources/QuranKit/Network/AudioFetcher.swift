//
//  File.swift
//  
//
//  Created by Imthath on 20/06/21.
//

import Foundation
import MINetworkKit

//struct AudioRequest: MIRequest {
//  var path: String
//  var method: MINetworkMethod = .get
//  var params: [String: Any]? = nil
//  var headers: [String: String]? = nil
//  var body: Data? = nil
//}
//
//extension AudioRequest {
//  var baseURL: String { "https://api.alquran.cloud/v1/" }
//  var urlString: String { baseURL + path }
//}
//
//extension AudioRequest {
//  static func audioVersesMeta(language: String = "ar") -> Self {
//    .init(path: "edition", params: ["format": "audio", "language": language, "type": "versebyverse"])
//  }
//
//  static func audioURL(reciterID: String, surah: Int16, ayah: Int16) -> Self {
//    .init(path: "ayah/\(surah):\(ayah)/\(reciterID)")
//  }
//}
//
//internal class AudioResponse<DataType: Codable>: Codable {
//
//    var data: [DataType] = []
//
//    internal init() { }
//
//}
//
//class GetAudioData<T: Codable>: GetObject<AudioResponse<T>> { }
//
//// MARK: - VerseMeta
//struct Reciter: Codable {
//    let identifier, language, arabicName, englishName: String
////    let format, type: String
//
//  enum CodingKeys: String, CodingKey {
//      case identifier, language
//      case arabicName = "name"
//      case englishName
////    case format, type
//  }
//}
//
//class AudioService {
//  private init() { }
//
//  public static let shared: AudioService = .init()
//
//  private lazy var getVerseMeta = GetAudioData<Reciter>()
//
//  func fetchVerseByVerseReciters(inLang language: String = "ar") {
//    let request: AudioRequest = .audioVersesMeta(language: language)
//    // only 17 reciters avaialbe in Arabic and only 1 in English. So need for pagination.
//    // By default it returns 20 results, at max.
//    getVerseMeta.perform(request) { result in
//      switch result {
//      case .success(let response):
//        print(response.data.count)
//        response.data.forEach { print($0)}
//        print(response.data)
//      case .failure(let error):
//        print(error.localizedDescription)
//      }
//    }
//  }
//}
