//
//  TimeInterval-Extensions.swift
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

extension TimeInterval {
    var milliseconds: Int {
        return Int(self * 1_000)
    }
}
