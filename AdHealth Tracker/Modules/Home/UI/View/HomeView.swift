//
//  HomeView.swift
//  AdHealth Tracker
//
//  Created for AdHealth Tracker in 2023
//  Using Swift 5.0
//  Running on macOS 13.1
//
//  Created by Bryan Caro on 26/2/23.
//  
//

import SwiftUI

struct HomeView: View {
    //  MARK: - Observed Object
    @StateObject private var viewModel = HomeViewModel()
    
    //  MARK: - Variables
    //  MARK: - Principal View
    var body: some View {
        ZStack {
            VStack {
                Text("API REQUEST")
                Color.blue.frame(width: 50, height: 50)
                    .onTapGesture {
                        Task {
                            await viewModel.repository.getHealthGoals()
                        }
                        
                    }
                
                Text("WRITE TO CORE DATA")
                Color.yellow.frame(width: 50, height: 50)
                    .onTapGesture {
                        viewModel.repository.writeToCoreData()
                    }
                
                Text("READ FROM CORE DATA")
                Color.green.frame(width: 50, height: 50)
                    .onTapGesture {
                        viewModel.repository.getHealtGoalsCoreData()
                    }
                
                Text("REMOVE ALL FROM CORE DATA")
                Color.red.frame(width: 50, height: 50)
                    .onTapGesture {
                        viewModel.repository.deleteAllCoreData()
                    }
                
                Group {
                    Text("HEALTH REQUEST")
                    Color.purple.frame(width: 50, height: 50)
                        .onTapGesture {
//                            viewModel.requestHealth()
                        }
                    
//                    Text("REQUEST DAILY STEPS \(viewModel.steps)")
//                    Color.purple.frame(width: 50, height: 50)
//                        .onTapGesture {
//                            viewModel.requestSteps()
//                        }
                }
                
            }
        }
        .onAppear(perform: viewModel.onAppear)
        .onDisappear(perform: viewModel.onDisappear)
    }
}

//  MARK: - Actions
extension HomeView {}

//  MARK: - Local Components
extension HomeView {}

//  MARK: - Preview
struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
