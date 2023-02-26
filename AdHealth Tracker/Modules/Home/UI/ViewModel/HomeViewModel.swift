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

final class HomeViewModel: ObservableObject {
    @Published var isLoading = true
    
    private var repository: HomeUseCasesProtocol!
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
}

//  MARK: - UseCasesOutputProtocol
extension HomeViewModel: HomeUseCasesOutputProtocol {
    func onAppearSuccess() {
        print("[🟢] [HomeViewModel] [onAppear]")
    }
    
    func onDisappearSuccess() {
        print("[🟢] [HomeViewModel] [onDisappear]")
    }
    
    func defaultError(_ errorString: String) {
        print("[🔴] [HomeViewModel] [Error]: \(errorString)")
        haptic(type: .error)
        isLoading = false
    }
}
