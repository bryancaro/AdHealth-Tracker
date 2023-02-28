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
import ConfettiSwiftUI

struct HomeView: View {
    //  MARK: - Observed Object
    @EnvironmentObject private var mainViewModel: LaunchScreenViewModel
    @StateObject private var viewModel = HomeViewModel()
    
    //  MARK: - Variables
    var namespace: Namespace.ID
    //  MARK: - Principal View
    var body: some View {
        ZStack(alignment: .top) {
            Color.Black2
                .edgesIgnoringSafeArea(.vertical)
            
            ScrollView {
                CoverComponent
                
                DailyGoalsView(goals: $viewModel.goals)
            }
            .refreshable {
                updateAllData()
            }
            
            HeaderComponent
            
            UpdateStepsComponent
        }
        .onChange(of: mainViewModel.showError, perform: getErrorFromMain)
        .onChange(of: viewModel.showError, perform: getError)
        .sheet(isPresented: $viewModel.showMe, content: {
            MeView()
        })
        .confettiCannon(counter: $viewModel.counter, repetitions: 2, repetitionInterval: 0.7)
        .animation(.springAnimation, value: UUID())
        .onAppear(perform: viewModel.repository.onAppear)
        .onDisappear(perform: viewModel.repository.onDisappear)
    }
}

//  MARK: - Actions
extension HomeView {
    private func getError(showError: Bool) {
        mainViewModel.showError = showError
        mainViewModel.errorString = viewModel.errorString
    }
    
    private func getErrorFromMain(showError: Bool) {
        viewModel.showError = showError
    }
    
    private func updateSteps() {
        withAnimation {
            mainViewModel.repository.fetchDailyStepCount()
            viewModel.playConfeti()
        }
    }
    
    private func updateAllData() {
        viewModel.repository.updateHealthGoals()
    }
}

//  MARK: - Local Components
extension HomeView {
    private var CoverComponent: some View {
        GeometryReader { proxy in
            let scrollY = proxy.frame(in: .global).minY
            
            VStack {
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .frame(height: scrollY > 0 ? 320 + scrollY : 400)
            .background(
                Image("launch-screen")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .matchedGeometryEffect(id: "launch-image", in: namespace)
                    .offset(y: scrollY > 0 ? -scrollY : 0)
                    .scaleEffect(scrollY > 0 ? (scrollY / 1000) + 1 : 1)
                    .blur(radius: scrollY / 50)
            )
            .overlay(
                LinearGradient(
                    gradient: Gradient(colors: [Color.black.opacity(0.2), Color.black]),
                    startPoint: .top,
                    endPoint: .bottom
                )
                .matchedGeometryEffect(id: "launch-gradient", in: namespace)
                .offset(y: scrollY > 0 ? -scrollY : 0)
            )
            .mask(
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .matchedGeometryEffect(id: "launch-mask", in: namespace)
                    .offset(y: scrollY > 0 ? -scrollY : 0)
            )
            .overlay(
                VStack {
                    Spacer()
                    
                    HealthDataComponent
                    
                    GoalsDataView(totalGoals: $viewModel.totalGoals,
                                  totalPoints: $viewModel.totalPoints,
                                  completed: $viewModel.completed,
                                  points: $viewModel.points)
                    .offset(y: 50)
                }
                    .offset(y: scrollY > 0 ? -scrollY : 0)
            )
        }
        .frame(height: 400)
    }
    
    private var HeaderComponent: some View {
        HStack {
            VStack {
                Spacer()
            }
            .frame(width: 50, height: 50)
            .background(
                Image("adidas-logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .matchedGeometryEffect(id: "adidas-logo", in: namespace)
            )
            
            Spacer()
            
            Button(action: viewModel.showMeAction) {
                HStack {
                    Text("develop_by")
                        .font(.footnote)
                        .bold()
                        .foregroundColor(.AdidasGreen)
                    
                    Image("me")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 40, height: 40)
                        .clipShape(Circle())
                }
                .padding(5)
                .background(Color.black)
                .cornerRadius(10)
                .mediumShadow(.md_2)
            }
            .buttonStyle(.plain)
            .padding(10)
        }
        .padding(.horizontal)
    }
    
    private var HealthDataComponent: some View {
        VStack {
            Text("Steps")
                .font(.title2)
                .foregroundColor(.AdidasGreen)
            
            Text("\(mainViewModel.steps, specifier: "%2.f")")
                .font(.system(size: 64, weight: .heavy))
                .italic()
                .foregroundColor(.white)
            
            VStack {
                Spacer()
            }
            .frame(width: 50, height: 50)
            .background(
                Image("health-logo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .matchedGeometryEffect(id: "health-logo", in: namespace)
                    .onTapGesture(perform: updateSteps)
            )
        }
        .padding(.top, 30)
    }
    
    private var UpdateStepsComponent: some View {
        AdButton(title: "Run", action: updateSteps)
            .frame(maxHeight: .infinity, alignment: .bottom)
    }
}

//  MARK: - Preview
struct HomeView_Previews: PreviewProvider {
    @Namespace static var namespace
    static var previews: some View {
        HomeView(namespace: namespace)
            .environmentObject(LaunchScreenViewModel())
    }
}
