//
//  PokemonPage.swift
//  PokedexApp
//
//  Created by Guilherme Teixeira de Mello on 09/06/24.
//

import Foundation

struct PokemonPage: Codable {
    var count: Int
    var next: String
    var results: [Pokemon]
}
