//
//  Pokemon.swift
//  PokedexApp
//
//  Created by Guilherme Teixeira de Mello on 09/06/24.
//

import Foundation

struct Pokemon: Codable, Identifiable, Equatable {
    let id = UUID()
    let name: String
    let url: String
    
    static var samplePokemon = Pokemon(name: "Bulbasaur", url: "https://pokeapi.co/api/v2/pokemon/1/")
}
