//
//  HomeHealthKit.swift
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

protocol HomeHealthKitProtocol {}

final class HomeHealthKit: Health, HomeHealthKit.ServerCalls {
    typealias ServerCalls = HomeHealthKitProtocol
}
