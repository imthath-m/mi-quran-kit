import XCTest
@testable import QuranKit

//final class QuranKitTests: XCTestCase {
//  func testExample() {
//    // This is an example of a functional test case.
//    // Use XCTAssert and related functions to verify your tests produce the correct
//    // results.
//    fetchVerseMeta()
//  }
//
//  private lazy var getVerseMeta = GetAudioData<VerseMeta>()
//
//  func fetchVerseMeta(language: String = "ar") {
//    let audio = expectation(description: "audio")
//    let request: AudioRequest = .audioVersesMeta(language: language)
//    // only 17 reciters avaialbe in Arabic and only 1 in English. So need for pagination.
//    // By default it returns 20 results, at max.
//    getVerseMeta.perform(request) { result in
//      switch result {
//      case .success(let response):
//        XCTAssertEqual(response.data.count, 17)
//        //            print(response.data.count)
//        //            response.data.forEach { print($0)}
//        //            print(response.data)
//        audio.fulfill()
//      case .failure(let error):
//        print(error.localizedDescription)
//      }
//    }
//    wait(for: [audio], timeout: 100)
//  }
//}
