//
//  JsonConversion.swift
//  Naruhodo
//
//  Created by George Webster on 2/11/20.
//  Copyright © 2020 George Webster. All rights reserved.
//

import Foundation

public func dataFromJsonFile(_ fileName: String, in bundle: Bundle) -> Result<Data, Error> {
    return urlForJsonFile(fileName, in: bundle)
        .flatMap(trace)
        .flatMap(dataForURL)
}

public func dataForURL(_ url: URL) -> Result<Data, Error> {
    Result { try Data(contentsOf: url) }
}
