//
//  SummaryTests.swift
//  NaruhodoTests
//
//  Created by George Webster on 2/11/20.
//  Copyright © 2020 George Webster. All rights reserved.
//

import XCTest
@testable import Naruhodo

class SummaryTests: XCTestCase {

    func testLoadFromJson() {
        

        let bundle = Bundle(for: SummaryTests.self)
        let sut = dataFromJsonFile("summary_get_v2_response", in: bundle)
            .flatMap(summaryDTOFromData)
        
        switch sut {
        case .success(let dto):
            print(dto)
        case .failure(let error):
            XCTFail("failued to parse json with \(error.localizedDescription)")
        }
    }

}
