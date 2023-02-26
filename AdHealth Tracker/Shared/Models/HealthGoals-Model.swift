//
//  HealthGoals-Model.swift
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

//  MARK: - RESPONSE
struct HealthGoalsResponse: Decodable {
    let goals: [GoalResponse]
}

struct GoalResponse: Decodable {
    let id: Int
    let goal: String
    let description: String
    let title: String
    let type: String
    let reward: RewardResponse
}

struct RewardResponse: Decodable {
    let trophy: String
    let points: String
}

//  MARK: - MODEL
struct HealthGoalsModel: Identifiable {
    let id: UUID
    let goals: [GoalModel]
    
    init(_ response: HealthGoalsResponse) {
        self.id = UUID()
        self.goals = response.goals.map({ GoalModel($0) })
    }
    
    init(goals: [GoalModel]) {
        self.id = UUID()
        self.goals = goals
    }
}

struct GoalModel: Identifiable {
    let id: Int
    let goal: String
    let description: String
    let title: String
    let type: String
    let reward: RewardModel
    
    init(_ response: GoalResponse) {
        self.id = response.id
        self.goal = response.goal
        self.description = response.description
        self.title = response.title
        self.type = response.type
        self.reward = RewardModel(response.reward)
    }
    
    init(id: Int, goal: String, description: String, title: String, type: String, reward: RewardModel) {
        self.id = id
        self.goal = goal
        self.description = description
        self.title = title
        self.type = type
        self.reward = reward
    }
}

struct RewardModel {
    let trophy: String
    let points: String
    
    init(_ response: RewardResponse) {
        self.trophy = response.trophy
        self.points = response.points
    }
    
    init(trophy: String, points: String) {
        self.trophy = trophy
        self.points = points
    }
}

//  MARK: - EXTENSION MODEL
extension HealthGoalsModel {
    static let empty = HealthGoalsModel(goals: [GoalModel]())
}
