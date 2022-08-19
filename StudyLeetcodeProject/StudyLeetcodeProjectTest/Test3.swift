//
//  Test3.swift
//  StudyLeetcodeProjectTest
//
//  Created by beliefduan on 2022/8/19.
//

import XCTest


class Test3: XCTestCase {

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verΩΩΩΩΩify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
        let s = Solution3()
        let res = s.lengthOfLongestSubstring_slide("123134523")
        XCTAssertTrue(res == 5)
    }


}
