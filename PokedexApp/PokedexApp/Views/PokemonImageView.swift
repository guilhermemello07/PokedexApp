//
//  PokemonImageView.swift
//  PokedexApp
//
//  Created by Guilherme Teixeira de Mello on 09/06/24.
//

import SwiftUI

struct PokemonImageView: View {
    @EnvironmentObject var viewModel: ViewModel
    let pokemon: Pokemon
    
    var pokemonIndex: Int {
        viewModel.getPokemonIndex(pokemon: pokemon)
    }
    
    var imageUrl: String?
    
    var body: some View {
        CacheAsyncImage(
            url: URL(string: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/\(pokemonIndex).png")!,
            scale: 1.0,
            transaction: Transaction(animation: .easeIn(duration: 0.3)))
        { phase in
            switch phase {
            case .success(let image):
                image
                    .resizable()
                    .scaledToFit()
                    .frame(minWidth: 80, minHeight: 80)
            case .failure(_ ):
                Image(systemName: "exclamationmark.circle")
                    .font(.system(size: 80))
                    .frame(minWidth: 80, minHeight: 80)
            case .empty:
                ProgressView()
                    .frame(minWidth: 80, minHeight: 80)
            @unknown default:
                Image(systemName: "questionmark")
                    .frame(minWidth: 80, minHeight: 80)
            }
        }
        .background(.thinMaterial)
        .clipShape(Circle())
        .shadow(radius: 8)
    }
}

#Preview {
    PokemonImageView(pokemon: Pokemon.samplePokemon)
        .environmentObject(ViewModel())
}
