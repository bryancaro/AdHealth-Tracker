//
//  HomeUseCasesFactory.swift
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

final class HomeUseCasesFactory {
    func makeUseCases() -> HomeRepository {
        return HomeRepository(output: HomeUseCasesOutputComposer([
            FirebaseAnalyticsHomeTracker()
        ]))
    }
}

final class HomeUseCasesOutputComposer: HomeUseCasesOutputProtocol {
    let outputs: [HomeUseCasesOutputProtocol]
    
    init(_ outputs: [HomeUseCasesOutputProtocol]) {
        self.outputs = outputs
    }
    
    func onAppearSuccess() {
        outputs.forEach({ $0.onAppearSuccess() })
    }
    
    func onDisappearSuccess() {
        outputs.forEach({ $0.onDisappearSuccess() })
    }
}
