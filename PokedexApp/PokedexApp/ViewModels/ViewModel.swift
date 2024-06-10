//
//  ViewModel.swift
//  PokedexApp
//
//  Created by Guilherme Teixeira de Mello on 09/06/24.
//

import Foundation
import SwiftUI

@MainActor
class ViewModel: ObservableObject {
    
    @Published var pokemons = [Pokemon]()
    @Published var pokemonDetails: DetailPokemon?
    @Published var searchText = ""
    @Published var error: Error?
    
    let baseUrl = "https://pokeapi.co/api/v2/pokemon/"
    let limitPerPage = 20
    var offset = 0
    
    var urlString: String {
        return "\(baseUrl)?offset=\(offset)&limit=\(limitPerPage)"
    }
    
    var filteredPokemon: [Pokemon] {
        return searchText == "" ? pokemons : pokemons.filter {
            $0.name.contains(searchText.lowercased())
        }
    }
    
    init() {
        loadData()
    }
    
    func handleRefresh() {
        pokemons.removeAll()
        offset = 0
        loadData()
    }
    
    func getPokemonIndex(pokemon: Pokemon) -> Int {
        if let index = self.pokemons.firstIndex(of: pokemon) {
            return index + 1
        }
        return 0
    }
    
    func getPokemonImageUrl(pokemon: Pokemon) -> URL {
        guard let url = URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(self.getPokemonIndex(pokemon: pokemon)).png") else { fatalError() }
        return url
    }
}

// MARK: - Extension Async
extension ViewModel {
    func fetchPokemonPageAsync() async throws {
        do {
            guard let url = URL(string: urlString) else { throw PokemonError.invalidUrl }
            let (data, response) = try await URLSession.shared.data(from: url)
            guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw PokemonError.serverError }
            guard let pokemonsList = try? JSONDecoder().decode(PokemonPage.self, from: data) else { throw PokemonError.invalidData }
            pokemons.append(contentsOf: pokemonsList.results)
            offset += limitPerPage
        } catch {
            self.error = error
        }
    }
    
    func loadData() {
        Task(priority: .medium) {
            try await fetchPokemonPageAsync()
        }
    }
    
    func getPokemonDetail(for pokemon: Pokemon) async throws {
        let id = getPokemonIndex(pokemon: pokemon)
        do {
            guard let url = URL(string: "\(baseUrl)\(id)") else { throw PokemonError.invalidUrl }
            let (data, response) = try await URLSession.shared.data(from: url)
            guard (response as? HTTPURLResponse)?.statusCode == 200 else { throw PokemonError.serverError }
            guard let detailedPokemon = try? JSONDecoder().decode(DetailPokemon.self, from: data) else { throw PokemonError.invalidData }
            pokemonDetails = detailedPokemon
        } catch {
            self.error = error
        }

    }
    
    func formatPokemonData(with value: Int) -> String {
        let dValue = Double(value)
        let string = String(format: "%.2f", dValue / 10)
        return string
    }
}
