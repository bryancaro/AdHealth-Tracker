//
//  HomeServices.swift
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

protocol HomeServicesProtocol: NetworkControllerProtocol {
    func getHealthGoals() async throws -> HealthGoalsResponse
}

extension NetworkController: HomeServicesProtocol {
    func getHealthGoals() async throws -> HealthGoalsResponse {
        let params: [String: Any] = [:]
        let endpoint = Endpoint(path: "/goals")
        
        return try await request(.get,
                                 type: HealthGoalsResponse.self,
                                 decoder: JSONDecoder(),
                                 url: endpoint.url,
                                 headers: endpoint.headers,
                                 params: params)
    }
}
