//
//  TestAVItemStatusUITests.swift
//  TestAVItemStatusUITests
//
//  Created by Guillaume Sabran on 4/6/17.
//  Copyright © 2017 PaperoInc. All rights reserved.
//

import XCTest

class TestAVItemStatusUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    func testExample() {
		if XCUIApplication().staticTexts["Video not ready"].exists {
			print("Button says: 'Video not ready'")
		} else {
			print("Button does't say 'Video not ready'")
		}
		sleep(5)
		if XCUIApplication().staticTexts["Video not ready"].exists {
			print("Button says: 'Video not ready'")
        } else {
            print("Button does't say 'Video not ready'")
		}

		var n = 10
		while !XCUIApplication().staticTexts["video ready"].exists && n > 0 {
			n -= 1
			sleep(5)
			print("Button does't say 'Video ready'")
		}
		if !XCUIApplication().staticTexts["video ready"].exists {
			XCTFail()
		}
    }
}
