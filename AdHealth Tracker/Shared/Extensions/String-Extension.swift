//
//  String-Extension.swift
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

extension String {
    var localized: String {
        var localizedString = NSLocalizedString(self, comment:"")
        localizedString = localizedString.replacingOccurrences(of: "%s", with: "%@")
        localizedString = localizedString.replacingOccurrences(of: "%1$s", with: "%@")
        localizedString = localizedString.replacingOccurrences(of: "%2$s", with: "%@")
        localizedString = localizedString.replacingOccurrences(of: "%3$s", with: "%@")
        localizedString = localizedString.replacingOccurrences(of: "%4$s", with: "%@")
        return localizedString
    }
}
