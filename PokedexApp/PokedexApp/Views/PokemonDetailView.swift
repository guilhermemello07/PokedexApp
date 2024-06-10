//
//  PokemonDetailView.swift
//  PokedexApp
//
//  Created by Guilherme Teixeira de Mello on 09/06/24.
//

import SwiftUI

struct PokemonDetailView: View {
    @EnvironmentObject var viewModel: ViewModel
    let pokemon: Pokemon
    
    var body: some View {
        VStack(spacing: 32) {
            PokemonImageView(pokemon: pokemon)
                .frame(width: 220, height: 220)
            
            Text("\(pokemon.name.capitalized)")
                .font(.largeTitle)
            
            VStack(spacing: 8) {
                Text("**Weight:** \(viewModel.formatPokemonData(with: viewModel.pokemonDetails?.weight ?? 0)) KG")
                Text("**Height:** \(viewModel.formatPokemonData(with: viewModel.pokemonDetails?.height ?? 0)) M")
                Text("**Type:** \(viewModel.pokemonDetails?.types[0].type.name.capitalized ?? "")")
                
                VStack(alignment: .trailing, spacing: 20) {
                    HStack {
                        Text("HP: ")
                            .font(.headline)
                        StatsView(statValue: CGFloat(viewModel.pokemonDetails?.stats[0].base_stat ?? 10))
                        Text("\(viewModel.pokemonDetails?.stats[0].base_stat ?? 0) / 180")
                    }
                    HStack {
                        Text("ATTACK: ")
                            .font(.headline)
                        StatsView(statValue: CGFloat(viewModel.pokemonDetails?.stats[1].base_stat ?? 10))
                        Text("\(viewModel.pokemonDetails?.stats[1].base_stat ?? 0) / 180")
                    }
                    HStack {
                        Text("SPEED: ")
                            .font(.headline)
                        StatsView(statValue: CGFloat(viewModel.pokemonDetails?.stats[5].base_stat ?? 10))
                        Text("\(viewModel.pokemonDetails?.stats[5].base_stat ?? 0) / 180")
                    }
                    
                }
                .frame(maxWidth: .infinity, maxHeight: 150)
                .padding(.vertical, 20)
                .background(.regularMaterial)
                .clipShape(.rect(cornerRadius: 20))
                
            }
        }
        .padding()
        .navigationTitle("\(pokemon.name.capitalized)")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            Task(priority: .medium) {
                try await viewModel.getPokemonDetail(for: pokemon)
            }
        }
    }
}

#Preview {
    PokemonDetailView(pokemon: Pokemon.samplePokemon)
        .environmentObject(ViewModel())
}
