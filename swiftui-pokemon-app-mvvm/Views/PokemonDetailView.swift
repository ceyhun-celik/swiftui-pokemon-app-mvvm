//
//  PokemonDetailView.swift
//  swiftui-pokemon-app-mvvm
//
//  Created by Ceyhun Çelik on 26.03.2023.
//

import SwiftUI

struct PokemonDetailView: View {
    @EnvironmentObject var viewModel: ViewModel
    let pokemon: Pokemon
    
    var body: some View {
        VStack {
            PokemonView(pokemon: pokemon)
            
            VStack(spacing: 10) {
                Text("**ID**: \(viewModel.pokemonDetails?.id ?? 0)")
                Text("**Weight**: \(viewModel.formatHeightWeight(value: viewModel.pokemonDetails?.weight ?? 0)) KG")
                Text("**Height**: \(viewModel.formatHeightWeight(value: viewModel.pokemonDetails?.height ?? 0)) M")
            }
        }
        .onAppear {
            viewModel.getDetails(pokemon: pokemon)
        }
    }
}

struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        PokemonDetailView(pokemon: Pokemon.samplePokemon).environmentObject(ViewModel())
    }
}
