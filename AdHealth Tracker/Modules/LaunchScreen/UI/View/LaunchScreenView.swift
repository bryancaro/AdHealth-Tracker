//
//  LaunchScreenView.swift
//  AdHealth Tracker
//
//  Created for AdHealth Tracker in 2023
//  Using Swift 5.0
//  Running on macOS 13.1
//
//  Created by Bryan Caro on 27/2/23.
//  
//

import SwiftUI

struct LaunchScreenView: View {
    //  MARK: - Observed Object
    @StateObject private var viewModel = LaunchScreenViewModel()
    
    //  MARK: - Variables
    @Namespace var namespace
    //  MARK: - Principal View
    var body: some View {
        ZStack {
            if viewModel.showHome {
                HomeView(namespace: namespace)
            } else {
                BackgroundComponent
                
                BottomComponent  
            }
            
            AdHealthLoading(show: $viewModel.isLoading)
            
            AdHealthAlert(show: $viewModel.showError, errorString: $viewModel.errorString)
        }
        .environmentObject(viewModel)
        .animation(.springAnimation.delay(0.6), value: viewModel.showHome)
        .onAppear(perform: viewModel.repository.onAppear)
        .onDisappear(perform: viewModel.repository.onDisappear)
    }
}

//  MARK: - Actions
extension LaunchScreenView {}

//  MARK: - Local Components
extension LaunchScreenView {
    private var BackgroundComponent: some View {
        VStack {
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(
            Image("launch-screen")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .matchedGeometryEffect(id: "launch-image", in: namespace)
        )
        .overlay(
            LinearGradient(
                gradient: Gradient(colors: [Color.black.opacity(0.2), Color.black]),
                startPoint: .top,
                endPoint: .bottom
            )
            .matchedGeometryEffect(id: "launch-gradient", in: namespace)
        )
        .mask(
            RoundedRectangle(cornerRadius: 10, style: .continuous)
                .matchedGeometryEffect(id: "launch-mask", in: namespace)
        )
        .edgesIgnoringSafeArea(.all)
    }
    
    private var BottomComponent: some View {
        VStack {
            Spacer()
            
            Text("launch_screen_title")
                .font(.title.bold())
                .foregroundColor(.white)
                .multilineTextAlignment(.center)
                .padding(.horizontal)
            
            HStack(spacing: 20) {
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
                
                VStack {
                    Spacer()
                }
                .frame(width: 50, height: 50)
                .background(
                    Image("health-logo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .matchedGeometryEffect(id: "health-logo", in: namespace)
                )
            }
            .padding(.vertical)
            
            AdButton(action: viewModel.repository.requestHealthKitAuthorization)
            
            Spacer()
                .frame(height: 50)
        }
    }
}

//  MARK: - Preview
struct LaunchScreenView_Previews: PreviewProvider {
    static var previews: some View {
        LaunchScreenView()
    }
}
