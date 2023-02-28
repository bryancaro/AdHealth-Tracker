//
//  ConfigurationManager.swift
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

class ConfigurationManager {
    func readConfiguration() -> [String: String]? {
        if let enviroment = Bundle.main.infoDictionary?["Configurations"] as? String {
            guard let pathOfPlist = Bundle.main.path(forResource: "Configuration\(enviroment)", ofType: "plist") else { return nil }
            
            let url = URL(fileURLWithPath: pathOfPlist)
            let data = try! Data(contentsOf: url)
            
            guard let plist = try! PropertyListSerialization.propertyList(from: data, options: .mutableContainers, format: nil) as? [String: String] else { return nil }
            return plist
        }
        return nil
    }
}
