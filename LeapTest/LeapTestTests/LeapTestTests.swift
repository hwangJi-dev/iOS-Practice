//
//  LeapTestTests.swift
//  LeapTestTests
//
//  Created by 황지은 on 2020/04/22.
//  Copyright © 2020 황지은. All rights reserved.
//

import XCTest
@testable import LeapTest

class LeapTestTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

   
    //네 개의 테스트 합수 추가
    func testYear1(){
        let year:LeapYear! = LeapYear()
        let results:Bool = year.isLeapYear(year:2019)
        let expected:Bool = false
        XCTAssertEqual(results,expected)
    }
    func testYear2(){
        let year:LeapYear! = LeapYear()
        let results:Bool = year.isLeapYear(year:2020)
        let expected:Bool = true
        XCTAssertEqual(results,expected)
    }
    func testYear3(){
        let year:LeapYear! = LeapYear()
        let results:Bool = year.isLeapYear(year:2100)
        let expected:Bool = false
        XCTAssertEqual(results,expected)
    }
    func testYear4(){
        let year:LeapYear! = LeapYear()
        let results:Bool = year.isLeapYear(year:2400)
        let expected:Bool = true
        XCTAssertEqual(results,expected)
    }

}
