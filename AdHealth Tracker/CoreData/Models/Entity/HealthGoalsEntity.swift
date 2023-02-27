//
//  HealthGoalsEntity.swift
//  AdHealth Tracker
//
//  Created by Bryan Caro on 27/2/23.
//

import Foundation
import CoreData

extension HealthGoalsModel {
    @discardableResult
    func convertToEntity(context: NSManagedObjectContext) -> HealthGoalsEntity {
        let entity = HealthGoalsEntity(context: context)
        entity.healtGoals?.addingObjects(from: self.goals.convertToEntity(context: context))
        
        return entity
    }
}

extension [GoalModel] {
    @discardableResult
    func convertToEntity(context: NSManagedObjectContext) -> [GoalsEntity] {
        var entityArray = [GoalsEntity]()
        
        for value in self {
            let entity = GoalsEntity(context: context)
            entity.id = Int32(value.id)
            entity.goal = value.goal
            entity.descript = value.description
            entity.title = value.title
            entity.type = value.type
            entity.goalReward = value.reward.convertToEntity(context: context)
            
            entityArray.append(entity)
        }
        
        return entityArray
    }
}

extension RewardModel {
    @discardableResult
    func convertToEntity(context: NSManagedObjectContext) -> RewardEntity {
        let entity = RewardEntity(context: context)
        entity.trophy = self.trophy
        entity.points = self.points
        
        return entity
    }
}
