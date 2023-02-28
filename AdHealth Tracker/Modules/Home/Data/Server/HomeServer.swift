//
//  HomeServer.swift
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

protocol HomeServerProtocol {
    func getHealthGoals() async throws -> HealthGoalsResponse
}

final class HomeServer: Network, HomeServer.ServerCalls {
    typealias ServerCalls = HomeServerProtocol
    
    func getHealthGoals() async throws -> HealthGoalsResponse {
        try await manager.getHealthGoals()
    }
}
