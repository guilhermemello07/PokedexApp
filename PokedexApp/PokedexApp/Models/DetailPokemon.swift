//
//  DetailPokemon.swift
//  PokedexApp
//
//  Created by Guilherme Teixeira de Mello on 09/06/24.
//

import Foundation

struct DetailPokemon: Codable {
    var id: Int
    var height: Int
    var weight: Int
    var stats: [Stat]
    var types: [typeElement]
}

struct Stat: Codable {
    var base_stat: Int
    var stat: Species
}

struct Species: Codable {
    let name: String
}

struct typeElement: Codable {
    let slot: Int
    let type: Species
}


