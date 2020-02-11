//
//  Configuration.swift
//  Naruhodo
//
//  Created by George Webster on 2/11/20.
//  Copyright © 2020 George Webster. All rights reserved.
//

import Foundation

struct Configuration: Codable {
    
    var apiKey: String
}

extension Configuration {
    
    static func makeFromData(_ data: Data) -> Result<Configuration, Error> {
        Result {
            try JSONDecoder().decode(Configuration.self, from: data)
        }
    }
}
