//
//  AnalyticsEvent.swift
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

protocol AnalyticsEngine {
    func sendAnalyticsEvent(_ event: AnalyticEvent)
}

protocol AnalyticEvent {
    var name: String { get }
    var metadata: [String: Any] { get }
}
