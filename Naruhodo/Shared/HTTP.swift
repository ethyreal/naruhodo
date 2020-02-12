//
//  HTTP.swift
//  Naruhodo
//
//  Created by George Webster on 2/11/20.
//  Copyright © 2020 George Webster. All rights reserved.
//

import Foundation

enum HTTP {
    
    enum Method {
        case get
    }
    
    enum Header {
        
        enum Auth {
            static let key = "Authorization"
            static func value(form config: Configuration) -> String {
                "Bearer \(config.apiKey)"
            }
        }
    }
}

func requestFactory(_ configuration: Configuration) -> (HTTP.Method, URL) -> URLRequest {
    
    return { (method: HTTP.Method, url:URL) in
        var request = URLRequest(url: url)
        request[header: HTTP.Header.Auth.key] = HTTP.Header.Auth.value(form: configuration)
        return request
    }
}

