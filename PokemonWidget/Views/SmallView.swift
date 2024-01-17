//
//  SmallView.swift
//  PokemonWidgetExtension
//
//  Created by Kateryna BRYLINSKA on 16/01/2024.
//

import SwiftUI

struct SmallView: View {
    let pokemon: PokemonEntity
    let image: Image?
    let imageSize: CGFloat
    
    var body: some View {
        VStack {
            PokemonCard(pokemon: pokemon, pokemonImage: image, colorCard: .white, colorGen: .gray, imageSize: imageSize)
            Spacer()
            NameView(pokemon: pokemon)
        }
        .padding()
    }
}
