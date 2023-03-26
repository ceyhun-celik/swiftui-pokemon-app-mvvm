//
//  ContentView.swift
//  swiftui-pokemon-app-mvvm
//
//  Created by Ceyhun Çelik on 26.03.2023.
//

import SwiftUI

struct PokemonListView: View {
    @StateObject var viewModel = ViewModel()
    
    private let adaptiveColumns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationView(content: {
            ScrollView{
                LazyVGrid(columns: adaptiveColumns, spacing: 10) {
                    ForEach(viewModel.filteredPokemon) { pokemon in
                        NavigationLink(destination: PokemonDetailView(pokemon: pokemon)) {
                            PokemonView(pokemon: pokemon)
                        }
                    }
                }
                .animation(.easeIn(duration: 0.3), value: viewModel.filteredPokemon.count)
                .navigationTitle("PokemonUI")
                .navigationBarTitleDisplayMode(.inline)
            }
            .searchable(text: $viewModel.searchText)
        })
        .environmentObject(viewModel)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonListView()
    }
}
