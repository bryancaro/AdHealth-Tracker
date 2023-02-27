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
        getHealtGoalsCoreData()
//        local.fetchItems()
    }
    
    func onDisappear() {
        print("🌑 onDisappear [Home]")
        delegate?.onDisappearSuccess()
        output.onDisappearSuccess()
    }
    
    func writeToCoreData() {
        do {
            try local.saveHealthGoalsArray(model: HealthGoalsModel.test.goals)
            print("FROM REPOSITORY SUCCESS WRITE DATA TO COREDATA")
        } catch let error {
            print(error.localizedDescription)
            print("FROM REPOSITORY FAILED WRITE DATA TO COREDATA")
        }
    }
    
    func getHealtGoalsCoreData() {
        do {
            let response = try local.getHealthGoals()
            let data = HealthGoalsModel(response)
            print("FROM REPOSITORY SUCCESS READ DATA: \(data.goals)")
        } catch let error {
            print("FROM REPOSITORY FAILED READ DATA")
            print(error.localizedDescription)
        }
    }
    
    func deleteAllCoreData() {
        local.deleteAll()
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
