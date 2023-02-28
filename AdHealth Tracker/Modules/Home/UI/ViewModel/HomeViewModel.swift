//
//  HomeViewModel.swift
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
import CoreData

final class HomeViewModel: ObservableObject {
    @Published var isLoading = true
    @Published var appError: AppError?
    @Published var showMe = false
    
    
    ///
    @Published var totalGoals: Int = 0
    @Published var totalPoints: Int = 0
    @Published var completed: Int = 0
    @Published var points: Int = 0
    @Published var counter: Int = 0
    ///
    
    var repository: HomeUseCasesProtocol!
    //  MARK: - Lifecycle
    init(repository: HomeUseCasesProtocol = HomeUseCasesFactory().makeUseCases()) {
        self.repository = repository
        self.repository.delegate = self
    }
    
    func onAppear() {
        repository.onAppear()
    }
    
    func onDisappear() {
        repository.onDisappear()
    }
    
    func hideLoadingView() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
            self.isLoading = false
        })
    }
    
    func showMeAction() {
        showMe = true
    }
    
    func playConfeti() {
        counter += 1
    }
}

//  MARK: - UseCasesOutputProtocol
extension HomeViewModel: HomeUseCasesOutputProtocol {
    func onAppearSuccess() {
        print("[🟢] [HomeViewModel] [onAppear]")
//        fetchItems()
//
//        DispatchQueue.main.asyncAfter(wallDeadline: .now() + 10, execute: {
//            self.addFruit()
//        })
//        Task {
//           await repository.getHealthGoals()
//        }
    }
    
    func onDisappearSuccess() {
        print("[🟢] [HomeViewModel] [onDisappear]")
    }
    
    func getHealthGoalsSuccess(data: HealthGoalsModel) {
//        print(data)
    }
    
    func getHealthGoalsFailed(error: Error) {
        defaultError(error.localizedDescription)
    }
    
    func defaultError(_ errorString: String) {
        print("[🔴] [HomeViewModel] [Error]: \(errorString)")
        haptic(type: .error)
        DispatchQueue.main.async {
            self.isLoading = false
            self.appError = AppError(errorString: errorString)
        }
    }
}
