//
//  PokemonError.swift
//  PokedexApp
//
//  Created by Guilherme Teixeira de Mello on 09/06/24.
//

import Foundation

enum PokemonError: Error, LocalizedError {
    case invalidUrl
    case serverError
    case invalidData
    case unknown(Error)
    
    var errorDescription: String? {
        switch self {
        case .invalidUrl:
            return "There was an error accessing the resource, please check your internet connection and try again."
        case .serverError:
            return "There was an error with the server. Please try again later."
        case .invalidData:
            return "The pokemon data is invalid. Please try again later."
        case .unknown(let error):
            return error.localizedDescription
        }
    }
}
