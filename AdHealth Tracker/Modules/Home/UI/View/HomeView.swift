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
                Text("Hello, World!")
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
