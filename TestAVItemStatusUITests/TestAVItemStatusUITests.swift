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
		sleep(5)
		if !XCUIApplication().staticTexts["video ready"].exists {
			XCTFail()
		}
    }
}
