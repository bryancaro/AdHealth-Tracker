//
//  NetworkResponse.swift
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

//  MARK: - Empty Response
class EmptyResponse: Decodable {}

//  MARK: - Error Response
struct ErrorResponse: Codable, Error {
    let errorMessage : String?
    let description  : String?
    let code         : Int?
}
