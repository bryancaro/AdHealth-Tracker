//
//  DailyGoalsCard.swift
//  AdHealth Tracker
//
//  Created for AdHealth Tracker in 2023
//  Using Swift 5.0
//  Running on macOS 13.1
//
//  Created by Bryan Caro on 28/2/23.
//  
//

import SwiftUI

struct DailyGoalsCard: View {
    //  MARK: - Observed Object
    //  MARK: - Variables
    @Binding var steps: Double
    @Binding var data: GoalModel
    
    var isCompleted: Bool {
        steps == data.goalDouble
    }
    
    var badgetTitle: String {
        isCompleted ? "COMPLETED" : "NEW GOAL"
    }
    //  MARK: - Principal View
    var body: some View {
        ZStack {
            VStack(spacing: 30) {
                VStack(spacing: 10) {
                    Text(data.title)
                        .font(.body.bold())
                        .italic()
                    
                    Text("\(data.goal) steps")
                        .font(.footnote)
                }
                
                
                Text(badgetTitle)
                    .font(.caption2.bold())
                    .foregroundColor(.black)
                    .padding(.horizontal, 10)
                    .padding(.vertical, 5)
                    .background(Color.AdidasGreen)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
            }
            .padding(10)
            .frame(width: 170, height: 150)
            .background(Color.Black3)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.AdidasGreen, lineWidth: 4)
            )
            .padding(.vertical)
        }
        .onAppear(perform: onAppear)
        .onDisappear(perform: onDisappear)
    }
}

//  MARK: - Actions
extension DailyGoalsCard {
    private func onAppear() {}
    
    private func onDisappear() {}
}

//  MARK: - Local Components
extension DailyGoalsCard {}

//  MARK: - Preview
struct DailyGoalsCard_Previews: PreviewProvider {
    static var previews: some View {
        DailyGoalsCard(steps: .constant(0), data: .constant(GoalModel.test))
    }
}

