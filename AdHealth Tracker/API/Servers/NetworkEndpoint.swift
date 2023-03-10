//
//  NetworkEndpoint.swift
//  AdHealth Tracker
//
//  Created for AdHealth Tracker in 2023
//  Using Swift 5.0
//  Running on macOS 13.1
//
//  Created by Bryan Caro on 26/2/23.
//
//

import Foundation

struct Endpoint {
    var path       : String
    var queryItems : [URLQueryItem] = []
}

extension Endpoint {
    var url: URL {
        var components        = URLComponents()
        components.scheme     = "https"
        components.host       = ConfigReader.baseHost()
        components.path       = path
        components.queryItems = queryItems
        
        guard let url = components.url else {
            preconditionFailure("Invalid URL components: \(components)")
        }
        
        return url
    }
    
    var headers: [String: Any] {
        /*
         let user              = "some api security"
         let password          = "some api security"
         let credentialData    = "\(user):\(password)".data(using: String.Encoding.utf8)!
         let base64Credentials = credentialData.base64EncodedString(options: [])
         
         return ["Authorization": "Basic \(base64Credentials)"]
         */
        return [String: Any]()
    }
}
