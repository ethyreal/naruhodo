//
//  ConfigurationTests.swift
//  NaruhodoTests
//
//  Created by George Webster on 2/11/20.
//  Copyright © 2020 George Webster. All rights reserved.
//

import XCTest
@testable import Naruhodo

class ConfigurationTests: XCTestCase {

    func testLoadFromJson() {
        
        let bundle = Bundle(for: NaruhodoService.self)
        let sut = dataFromJsonFile("naruhodo_configuration", in: bundle)
            .flatMap(Configuration.makeFromData)
        
        switch sut {
        case .success(let config):
            XCTAssertFalse(config.apiKey.isEmpty)
            XCTAssert(config.apiKey != "replace-me-with-real-key-from-settings-personal-access-tokens")
        case .failure(let error):
            XCTFail("failed to load config with error: \(error.localizedDescription)")
        }
    }
}
