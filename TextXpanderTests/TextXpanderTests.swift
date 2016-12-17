//
//  TextXpanderTests.swift
//  TextXpanderTests
//
//  Created by Pardeep Chahal on 2016-12-12.
//  Copyright © 2016 Pardeep Chahal. All rights reserved.
//

import XCTest
@testable import TextXpander

class TextXpanderTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    
        
    func testDelKey()
    {
        let a =  KeyCodeMap.sharedInstance.isDelKey(key: 51)
        XCTAssertTrue(a == true)
    }
    func testDelimeterKey()
    {
        let a =  KeyCodeMap.sharedInstance.isDelimeterKey(keyStr: " ")
        XCTAssertTrue(a == true)
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
