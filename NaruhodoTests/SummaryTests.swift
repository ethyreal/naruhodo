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


    func testLoadFromAPI() {
        
        guard let config = try? Configuration.loadFromBunlde().get() else { XCTFail(); return }
        let factory = requestFactory(config)
        
        guard let summaryUrl = URL(string: API.Summary.urlString) else { XCTFail(); return }
        
        let request = factory(.get, summaryUrl)
        
        let exp = expectation(description: "loading")
        
        let task = URLSession.shared.dataTask(with: request, completionHandler: { (data, response, error) in
            
            DispatchQueue.main.async {
                guard let payload = data.flatMap(jsonDictionaryFromData) else {
                    XCTFail(); return }
                
                switch payload {
                case .success(let json):
                    print(json)
                case .failure: XCTFail()
                }
                exp.fulfill()
            }
            })
        
        task.resume()
        wait(for: [exp], timeout: 10)
    }
}
