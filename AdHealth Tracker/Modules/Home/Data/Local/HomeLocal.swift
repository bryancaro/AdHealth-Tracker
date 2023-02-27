//
//  HomeLocal.swift
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
import CoreData

protocol HomeLocalProtocol {
    func getHealthGoals() throws -> [GoalsEntity]
    func saveHealthGoalsArray(model: [GoalModel]) throws
    func deleteAll()
}

final class HomeLocal: CoreData, HomeLocal.LocalCalls {
    typealias LocalCalls = HomeLocalProtocol
    
    func getHealthGoals() throws -> [GoalsEntity] {
        let result = manager.getSavedData(GoalsEntity.self)
        
        switch result {
        case .success(let response):
            return response
        case .failure(let error):
            throw error
        }
    }
    
    func saveHealthGoalsArray(model: [GoalModel]) throws {
        let context = CoreDataController.shared.mainQueueContext
        model.convertToEntity(context: context)
        
        manager.saveData()
    }
    
    func deleteAll() {
        manager.deleteSavedData(GoalsEntity.self)
    }
}
