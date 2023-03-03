//
//  AppError.swift
//  FoodApp
//
//  Created by ahmed sherif on 22/02/2023.
//

import Foundation

enum AppError: LocalizedError {
    case errorDecoding
    case unknownError
    case invalidUrl
    case serverError(String)
    
    var errorDescription: String? {
        switch self {
        case .errorDecoding:
            return "Response could not be decoded"
        case .unknownError:
            return "Bruhhh!!! I have no idea what go on"
        case .invalidUrl:
            return "Heyy!!! Give me a valid URL"
        case.serverError(let error):
            return error
        }
    }
}
