//
//  ConfigReader.swift
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

class ConfigReader: NSObject {
    static func baseHost() -> String {
        valueFromPlist("baseHost")!
    }
    
    static func baseUrl() -> String {
        valueFromPlist("baseUrlWeb")!
    }
    
    static func environment() -> String {
        valueFromPlist("environment")!
    }
    
    static func userKey() -> String {
        valueFromPlist("userKey")!
    }
    
    static func passKey() -> String {
        valueFromPlist("passKey")!
    }
    
    static func actualVersion() -> String {
        valueFromPlist("version")!
    }
    
    static func actualBuild() -> String {
        valueFromPlist("build")!
    }
    
    static func valueFromPlist(_ key: String) -> String? {
        guard let dictionary = ConfigurationManager().readConfiguration() else { return nil }
        return dictionary[key]
    }
}
