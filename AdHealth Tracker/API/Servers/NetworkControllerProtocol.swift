//
//  NetworkControllerProtocol.swift
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

protocol NetworkProtocol {
    var manager: NetworkController { get }
}

protocol NetworkControllerProtocol: AnyObject {
    typealias Headers = [String: Any]
    
    //  MARK: - Async Await
    func request<T: Decodable>(_ method : HttpMethod,
                               type     : T.Type,
                               decoder  : JSONDecoder,
                               url      : URL,
                               headers  : Headers,
                               params   : [String: Any]?
    ) async throws -> T
}

enum HttpMethod: String{
    case get    = "GET"
    case post   = "POST"
    case put    = "PUT"
    case delete = "DELETE"
}

enum NetworkError: Error, Equatable {
    case invalidURL
    case noResponse
    case decode(String)
    case unknown
    case noInternet(String)
    case serverError(String)
}
