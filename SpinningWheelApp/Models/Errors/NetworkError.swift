//
//  NetworkError.swift
//  SpinningWheelApp
//
//  Created by Михаил Фролов on 09.02.2024.
//

import Foundation

enum NetworkError: Error {
    case noConnection
    case serverError(error: Error)
}
extension NetworkError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .noConnection:
            return "No connection to server"
        case .serverError(let error):
            return "Server error - \(error.localizedDescription)"
        }
    }
}
