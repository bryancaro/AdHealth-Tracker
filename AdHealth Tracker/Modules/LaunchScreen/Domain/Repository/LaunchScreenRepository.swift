//
//  LaunchScreenRepository.swift
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

final class LaunchScreenRepository {
    private let server: LaunchScreenServer
    private let local: LaunchScreenLocal
    private let healthKit: LaunchScreenHealthKit
    private let output: LaunchScreenUseCasesOutputProtocol
    
    weak var delegate: LaunchScreenUseCasesOutputProtocol?
    
    init(server: LaunchScreenServer = LaunchScreenServer(),
         local: LaunchScreenLocal = LaunchScreenLocal(),
         healthKit: LaunchScreenHealthKit = LaunchScreenHealthKit(),
         output: LaunchScreenUseCasesOutputProtocol) {
        self.server = server
        self.local = local
        self.healthKit = healthKit
        self.output = output
    }
}

extension LaunchScreenRepository: LaunchScreenUseCasesProtocol {
    func onAppear() {
        print("☀️ onAppear [LaunchScreen]")
        delegate?.onAppearSuccess()
        output.onAppearSuccess()
    }
    
    func onDisappear() {
        print("🌑 onDisappear [LaunchScreen]")
        delegate?.onDisappearSuccess()
        output.onDisappearSuccess()
    }
    
    func requestHealthKitAuthorization() {
        healthKit.requestHealthKitAuthorization { error in
            if let error {
                self.delegate?.requestHealthKitAuthorizationFailed(error.localizedDescription)
                self.output.requestHealthKitAuthorizationFailed(error.localizedDescription)
                return
            }
            
            self.delegate?.requestHealthKitAuthorizationSuccess()
            self.output.requestHealthKitAuthorizationSuccess()
        }
    }
    
    func fetchDailyStepCount() {
        healthKit.fetchDailyStepCount { steps, error in
            if let error {
                self.delegate?.fetchDailyStepCountFailed(error.localizedDescription)
                self.output.fetchDailyStepCountFailed(error.localizedDescription)
                return
            }
            
            self.delegate?.fetchDailyStepCountSuccess(steps: steps)
            self.output.fetchDailyStepCountSuccess(steps: steps)
        }
    }
}
