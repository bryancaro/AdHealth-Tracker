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
    
    func getHealthGoals() {
        let group = DispatchGroup()
        var model = HealthGoalsModel.empty
        
        group.enter()
        getHealtGoalsCoreData { [weak self] coreModel in
            guard let coreModel else {
                group.leave()
                return
            }
            
            model = coreModel
            group.leave()
            
            group.enter()
            if model.goals.isEmpty {
                self?.getHealthGoalsData { data, error in
                    if let error {
                        self?.delegate?.getHealthGoalsFailed(error: error)
                        self?.output.getHealthGoalsFailed(error: error)
                        group.leave()
                        return
                    }
                    
                    guard let data else { return }
                    model = data
                    group.leave()
                }
            } else {
                group.leave()
            }
        }
        
        group.notify(queue: .main) {
            guard !model.goals.isEmpty else { return }
            self.delegate?.getHealthGoalsSuccess(data: model)
            self.output.getHealthGoalsSuccess(data: model)
        }
    }
    
    func updateHealthGoals() {
        getHealthGoalsData { [weak self] data, error in
            guard let self = self else { return }
            
            if let error {
                self.delegate?.updateHealthGoalsFailed(error.localizedDescription)
                self.output.updateHealthGoalsFailed(error.localizedDescription)
                return
            }
            
            guard let data, !data.goals.isEmpty else { return }
            
            self.local.deleteAll()
            self.writeToCoreData(goals: data.goals)
        }
    }
}

//  MARK: - METHODS
extension HomeRepository {
    func getHealthGoalsData(completion: @escaping(HealthGoalsModel?, Error?) -> Void) {
        Task {
            do {
                let response = try await server.getHealthGoals()
                let data = HealthGoalsModel(response)
                completion(data, nil)
            } catch let error {
                completion(nil, error)
            }
        }
    }
    
    func getHealtGoalsCoreData(completion: @escaping(HealthGoalsModel?) -> Void) {
        do {
            let response = try local.getHealthGoals()
            let data = HealthGoalsModel(response)
            completion(data)
        } catch let error {
            print(error.localizedDescription)
            completion(nil)
        }
    }
    
    func writeToCoreData(goals: [GoalModel]) {
        do {
            try local.saveHealthGoalsArray(model: goals)
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
