//
//  ContentView.swift
//  PokedexApp
//
//  Created by Guilherme Teixeira de Mello on 09/06/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = ViewModel()
    @State private var showAlert = false
    
    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.filteredPokemon, id: \.name) { pokemon in
                    NavigationLink(destination: PokemonDetailView(pokemon: pokemon)) {
                        PokemonImageView(pokemon: pokemon)
                            .frame(width: 80, height: 80)
                            .onAppear {
                                if pokemon == viewModel.pokemons.last {
                                    viewModel.loadData()
                                }
                            }
                        
                        Text("\(pokemon.name.capitalized)")
                            .font(.title)
                            .padding(.leading, 16)
                    }
                }
            }
            .refreshable {
                viewModel.handleRefresh()
            }
            .searchable(text: $viewModel.searchText)
            .autocorrectionDisabled()
            .navigationTitle("Pokedex App")
            .animation(.easeInOut(duration: 0.3), value: viewModel.filteredPokemon.count)
            .onReceive(viewModel.$error, perform: { error in
                if error != nil {
                    showAlert.toggle()
                }
            })
            .alert(isPresented: $showAlert, content: {
                Alert(title: Text("Error"),
                      message: Text(viewModel.error?.localizedDescription ?? ""))
            })
        }
        .environmentObject(viewModel)
    }
}

#Preview {
    ContentView()
}
