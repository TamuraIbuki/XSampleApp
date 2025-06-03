//
//  exampleTest.swift
//  exampleTest
//
//  Created by 田村伊吹 on 2025/06/03.
//

import XCTest
import RealmSwift
@testable import XSampleApp

final class exampleTest: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    /// bodyCount関数に入れた文字列が空じゃなかった場合、trueを返すかをテスト
    func testBodyCount() throws {
        let vc = PostEditViewController()
        let result = vc.bodyCount("")
        XCTAssertTrue(result)
    }
    
    /// bodyCount関数に入れた文字列が140文字以下だった場合、trueを返すかをテスト
    func testBodyCount2() throws {
        let vc = PostEditViewController()
        let result = vc.bodyCount("小さな一歩でも、毎日続ければ大きな成果につながる。焦らず、コツコツ進もう。")
        XCTAssertTrue(result)
    }
    
    /// bodyCount関数に入れた文字列が141文字以上だった場合、falseを返すかをテスト
    func testBodyCount3() throws {
        let vc = PostEditViewController()
        let result = vc.bodyCount("毎日少しずつでも前に進むことが大切です。成果が見えない時期があっても、積み重ねは必ず自分の力になります。")
        XCTAssertFalse(result)
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
