//
//  DailyGoalsView.swift
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

struct DailyGoalsView: View {
    //  MARK: - Observed Object
    //  MARK: - Variables
    //  MARK: - Principal View
    var body: some View {
        ZStack {
            VStack(alignment: .leading) {
                TitleComponent
                    .padding(.leading)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 30) {
                        ForEach(0..<5) { data in
                            DailyGoalsCard(steps: .constant(0), data: .constant(GoalModel.test))
                        }
                    }
                    .padding(.leading)
                }
            }
        }
        .onAppear(perform: onAppear)
        .onDisappear(perform: onDisappear)
    }
}

//  MARK: - Actions
extension DailyGoalsView {
    private func onAppear() {}
    
    private func onDisappear() {}
}

//  MARK: - Local Components
extension DailyGoalsView {
    private var TitleComponent: some View {
        Text("Daily Goals")
            .font(.title.bold())
            .foregroundColor(.white)
    }
}

//  MARK: - Preview
struct DailyGoalsView_Previews: PreviewProvider {
    static var previews: some View {
        DailyGoalsView()
    }
}

