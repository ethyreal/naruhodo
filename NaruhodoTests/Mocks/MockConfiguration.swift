//
//  MockConfiguration.swift
//  NaruhodoTests
//
//  Created by George Webster on 2/11/20.
//  Copyright © 2020 George Webster. All rights reserved.
//

import Foundation
@testable import Naruhodo

extension Configuration {
    
    static func makeMock() -> Configuration {
        Configuration(apiKey: "mock")
    }
    
    static func loadFromBunlde() -> Result<Configuration, Error> {
        dataFromJsonFile("naruhodo_configuration", in: Bundle(for: NaruhodoService.self))
            .flatMap(Configuration.makeFromData)
    }
}
