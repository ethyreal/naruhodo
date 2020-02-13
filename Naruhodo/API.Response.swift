//
//  API.Response.swift
//  Naruhodo
//
//  Created by George Webster on 2/12/20.
//  Copyright © 2020 George Webster. All rights reserved.
//

import Foundation

extension API {
    
    struct Response {
        
        
        static var dateFormatter: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss.SSZ"
            return formatter
        }()
    }
}

