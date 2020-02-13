//
//  DataTransportTests.swift
//  NaruhodoTests
//
//  Created by George Webster on 2/12/20.
//  Copyright © 2020 George Webster. All rights reserved.
//

import XCTest
@testable import Naruhodo

class DataTransportTests: XCTestCase {

    func testLoadsLocalJsonDictionaries() {
        let bundle = Bundle(for: DataTransportTests.self)
        let urls = ["summary_get_v2_response"]
            .compactMap { try? urlForJsonFile($0, in: bundle).get() }
            .compactMap { URLRequest(url: $0) }
        let sut: DataTransport = URLSession.shared
        
        urls.forEach {
            let exp = expectation(description: "loading")
            
            sut.loadRequest($0) { (result) in
                
                DispatchQueue.main.async {
                    switch result.flatMap(jsonDictionaryFromData) {
                    case .success(let json):
                        ["data", "url", "object", "data_updated_at"].forEach { (key) in
                            XCTAssert(json.keys.contains(key))
                        }
                    case .failure(let error):
                        XCTFail("failed to load/parse json with error: \(error.localizedDescription)")
                    }
                    exp.fulfill()
                }
            }
            wait(for: [exp], timeout: 10)

        }
        
    }
}

//MARK:- Validation

extension DataTransportTests {
    
    func testValidateErrors() {
        
        let shouldFail = validateErrors((Data(), URLResponse(), NSError(domain: "testing", code: 42, userInfo: nil)))
        
        switch shouldFail {
        case .success: XCTFail()
        case .failure: break // pass
        }
        
        let shouldPass = validateErrors((Data(), URLResponse(), nil))
        
        switch shouldPass {
        case .success: break // pass
        case .failure: XCTFail()
        }

    }
    
    func testValidateReponse() {
        
        let shouldFail = validateResponse((Data(), nil))
        
        switch shouldFail {
        case .success: XCTFail()
        case .failure: break // pass
        }
        
        let shouldPass = validateResponse((Data(), URLResponse()))
        
        switch shouldPass {
        case .success: break // pass
        case .failure: XCTFail()
        }

    }

    func testValidateData() {
        
        let shouldFail = validateData((nil, URLResponse()))
        
        switch shouldFail {
        case .success: XCTFail()
        case .failure: break // pass
        }
        
        let shouldPass = validateData((Data(), URLResponse()))
        
        switch shouldPass {
        case .success: break // pass
        case .failure: XCTFail()
        }

    }

}
