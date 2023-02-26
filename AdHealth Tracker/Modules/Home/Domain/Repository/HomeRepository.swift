//
//  HomeRepository.swift
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

final class HomeRepository {
    private let server: HomeServer
    private let local: HomeLocal
    private let output: HomeUseCasesOutputProtocol
    
    weak var delegate: HomeUseCasesOutputProtocol?
    
    init(server: HomeServer = HomeServer(),
         local: HomeLocal = HomeLocal(),
         output: HomeUseCasesOutputProtocol) {
        self.server = server
        self.local = local
        self.output = output
    }
}

extension HomeRepository: HomeUseCasesProtocol {
    func onAppear() {
        print("☀️ onAppear [Home]")
        delegate?.onAppearSuccess()
        output.onAppearSuccess()
    }
    
    func onDisappear() {
        print("🌑 onDisappear [Home]")
        delegate?.onDisappearSuccess()
        output.onDisappearSuccess()
    }
    
    func getHealthGoals() async {
        do {
            let response = try await server.getHealthGoals()
            let data = HealthGoalsModel(response)
            delegate?.getHealthGoalsSuccess(data: data)
            output.getHealthGoalsSuccess(data: data)
        } catch let error {
            delegate?.getHealthGoalsFailed(error: error)
            output.getHealthGoalsFailed(error: error)
        }
    }
}
