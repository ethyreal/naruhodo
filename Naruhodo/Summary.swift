//
//  Summary.swift
//  Naruhodo
//
//  Created by George Webster on 2/11/20.
//  Copyright © 2020 George Webster. All rights reserved.
//

import Foundation


struct Summary {
    
    
}

extension API {
    enum Summary {
        static let urlString = "https://api.wanikani.com/v2/summary"
    }
}


struct SummaryDTO: Codable {
    
    var object: String
    var url: String
    var data_updated_at: Date
//    var data:
}

func summaryDTOFromData(_ data: Data) -> Result<SummaryDTO, Error> {
    Result {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .formatted(API.Response.dateFormatter)
        //decoder.dateDecodingStrategy = .iso8601
        return try decoder.decode(SummaryDTO.self, from: data)
    }
}
