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
    
    
    //AB -> BA
    func testExample() {
        
        var aStr = UnsafeMutablePointer<UniChar>.allocate(capacity: 2)
        aStr.initialize(to: 65)
        aStr = aStr.advanced(by: 1)
        aStr.initialize(to: 66)
        
        var length = 0
        var shortcut = 0
        var flag = CGEventFlags(rawValue: 0)
        
        
        
        //var expansion = TextManager.sharedInstance.getTextExpansion(key: 65, modifier: flag, &length , &shortcut)
        
        var par = TextManager.sharedInstance.expansions["par"]
        
        var key = KeyCode.sharedInstance.getUnicodeFromKey(key: 65, modifier: flag)
        let a =  TextManager.sharedInstance.expansions[key]
        
        let k:Int64 = 65
        let n:Int = Int.init(exactly: k)!
        XCTAssertTrue(par == "pardeep")
        XCTAssertTrue(a == "B")
        
        
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
