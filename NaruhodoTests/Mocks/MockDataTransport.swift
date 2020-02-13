//
//  MockDataTransport.swift
//  NaruhodoTests
//
//  Created by George Webster on 2/12/20.
//  Copyright © 2020 George Webster. All rights reserved.
//

import Foundation
@testable import Naruhodo

class MockDataTransport: DataTransport {
    
    var delay: TimeInterval = 0

    var result: Result<Data, Error> = .failure(DataTransportError.invalidUrl)
    
    var onComplete: (Result<Data, Error>) -> Void = { _ in }

    func loadRequest(_ request: URLRequest, completion: @escaping (Result<Data, Error>) -> Void) {
        
        DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
            completion(self.result)
            self.onComplete(self.result)
        }
    }
    
}
