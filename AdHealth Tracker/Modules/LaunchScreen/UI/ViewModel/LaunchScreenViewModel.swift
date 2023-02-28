//
//  LaunchScreenViewModel.swift
//  AdHealth Tracker
//
//  Created for AdHealth Tracker in 2023
//  Using Swift 5.0
//  Running on macOS 13.1
//
//  Created by Bryan Caro on 27/2/23.
//  
//

import Foundation

final class LaunchScreenViewModel: ObservableObject {
    @Published var isLoading = true
    @Published var showError = false
    @Published var errorString = ""
    @Published var showHome = false
    @Published var steps: Double = 0
    
    var repository: LaunchScreenUseCasesProtocol!
    //  MARK: - Lifecycle
    init(repository: LaunchScreenUseCasesProtocol = LaunchScreenUseCasesFactory().makeUseCases()) {
        self.repository = repository
        self.repository.delegate = self
    }
    
    func hideLoadingView() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
            self.isLoading = false
        })
    }
    
    func showLoadingView() {
        DispatchQueue.main.async {
            self.isLoading = true
        }
    }
}

//  MARK: - UseCasesOutputProtocol
extension LaunchScreenViewModel: LaunchScreenUseCasesOutputProtocol {
    func onAppearSuccess() {
        print("[🟢] [LaunchScreenViewModel] [onAppear]")
        hideLoadingView()
    }
    
    func onDisappearSuccess() {
        print("[🟢] [LaunchScreenViewModel] [onDisappear]")
    }
    
    func requestHealthKitAuthorizationSuccess() {
        repository.fetchDailyStepCount()
    }
    
    func requestHealthKitAuthorizationFailed(_ errorString: String) {
        defaultError(errorString)
    }
    
    func fetchDailyStepCountSuccess(steps: Double) {
        hideLoadingView()
        DispatchQueue.main.async {
            self.steps = steps
            self.showHome = true
        }
    }
    
    func fetchDailyStepCountFailed(_ errorString: String) {
        defaultError(errorString)
    }
    
    func defaultError(_ errorString: String) {
        print("[🔴] [LaunchScreenViewModel] [Error]: \(errorString)")
        DispatchQueue.main.async {
            haptic(type: .error)
            self.errorString = errorString
            self.isLoading = false
            self.showError = true
        }
    }
}
