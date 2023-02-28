//
//  LaunchScreenServer.swift
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

protocol LaunchScreenServerProtocol {}

final class LaunchScreenServer: Network, LaunchScreenServer.ServerCalls {
    typealias ServerCalls = LaunchScreenServerProtocol
}
