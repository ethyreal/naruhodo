//
//  APIResponseTests.swift
//  NaruhodoTests
//
//  Created by George Webster on 2/12/20.
//  Copyright © 2020 George Webster. All rights reserved.
//

import XCTest
@testable import Naruhodo

class APIResponseTests: XCTestCase {
    
    func testDateFormatter() {
        
        let sut = API.Response.dateFormatter

        ["2020-02-12T19:00:00.000000Z"].forEach {
            let date = sut.date(from: $0)
            XCTAssertNotNil(date)
        }
    }
}
