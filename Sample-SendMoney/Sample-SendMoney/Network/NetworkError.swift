//
//  NetworkError.swift
//  Sample-SendMoney
//
//  Created by Keith Samson on 7/14/26.
//

import Foundation

enum NetworkError: Error, LocalizedError {
    case invalidURL
    case invalidResponse
    case networkError(statusCode: Int)
    case decodingError(Error)
    case encodingError(Error)
    
    var errorDescription: String? {
        switch self {
        case .invalidURL:
            return "Invalid URL provided."
        case .invalidResponse:
            return "Invalid response from server."
        case .networkError(let statusCode):
            return "Server error with status code: \(statusCode)."
        case .decodingError(let error):
            return "Decoding failed: \(error.localizedDescription)"
        case .encodingError(let error):
            return "Encoding failed: \(error.localizedDescription)"
        }
    }
}
