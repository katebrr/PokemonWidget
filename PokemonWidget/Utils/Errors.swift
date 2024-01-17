//
//  Errors.swift
//  GameOfThronesWidgetExtension
//
//  Created by Kateryna BRYLINSKA on 15/01/2024.
//

import Foundation

enum DataManagerError: Error {
    case invalidURL
    case networkError(URLError)
    case invalidData
    case parsingError(Error)
    
    var localizedDescription: String {
        switch self {
        case .invalidURL:
            return "Invalid URL."
        case .networkError(let error):
            return "Network error: \(error.localizedDescription)"
        case .invalidData:
            return "Invalid data received."
        case .parsingError(let error):
            return "Parsing error: \(error.localizedDescription)"
        }
    }
}
