//
//  GoalsDataView.swift
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

struct GoalsDataView: View {
    //  MARK: - Observed Object
    //  MARK: - Variables
    @Binding var totalGoals: Int
    @Binding var totalPoints: Int
    @Binding var completed: Int
    @Binding var points: Int
    //  MARK: - Principal View
    var body: some View {
        ZStack {
            HStack(spacing: 40) {
                VStack(alignment: .trailing) {
                    totalGoalsComponent
                    
                    totalPointsComponent
                }
                
                Rectangle()
                    .frame(width: 4, height: 70)
                    .foregroundColor(.AdidasGreen)
                
                VStack(alignment: .leading) {
                    completedComponent
                    
                    pointsComponent
                }
            }
            .padding()
            .frame(height: 110)
            .background(Color.Black3)
            .clipShape(RoundedRectangle(cornerRadius: 16))
        }
        .onAppear(perform: onAppear)
        .onDisappear(perform: onDisappear)
    }
}

//  MARK: - Actions
extension GoalsDataView {
    private func onAppear() {}
    
    private func onDisappear() {}
}

//  MARK: - Local Components
extension GoalsDataView {
    private var totalGoalsComponent: some View {
        HStack {
            Text("\(totalGoals)")
                .font(.system(size: 32, weight: .bold))
                .foregroundColor(.white)
            
            Text("Total Goals")
                .font(.body)
                .foregroundColor(.AdidasGreen)
        }
    }
    
    private var totalPointsComponent: some View {
        HStack {
            Text("\(totalPoints)")
                .font(.system(size: 32, weight: .bold))
                .foregroundColor(.white)
            
            Text("Total points")
                .font(.body)
                .foregroundColor(.AdidasGreen)
        }
    }
    
    private var completedComponent: some View {
        HStack {
            Text("\(completed)")
                .font(.system(size: 32, weight: .bold))
                .foregroundColor(.white)
            
            Text("Completed")
                .font(.body)
                .foregroundColor(.AdidasGreen)
        }
    }
    
    private var pointsComponent: some View {
        HStack {
            Text("\(points)")
                .font(.system(size: 32, weight: .bold))
                .foregroundColor(.white)
            
            Text("Points")
                .font(.body)
                .foregroundColor(.AdidasGreen)
        }
    }
}

//  MARK: - Preview
struct GoalsDataView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.Black2
                .edgesIgnoringSafeArea(.all)
            
            GoalsDataView(totalGoals: .constant(6), totalPoints: .constant(100), completed: .constant(14), points: .constant(5))
        }
    }
}

