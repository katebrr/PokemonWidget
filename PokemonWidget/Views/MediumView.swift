//
//  MediumView.swift
//  PokemonWidgetExtension
//
//  Created by Kateryna BRYLINSKA on 16/01/2024.
//

import SwiftUI

struct MediumView: View {
    
    let pokemon: PokemonEntity
    
    let image: Image?
    
    var body: some View {
        ZStack {
            HStack(spacing: 0) {
                VStack {
                    PokemonCard(pokemon: pokemon, pokemonImage: image, colorCard: .clear, colorGen: Color(red: 1.0, green: 1.0, blue: 0.0), imageSize: 60)
                    Spacer()
                    NameView(pokemon: pokemon)
                }
                    .padding()
                    .frame(maxWidth: .infinity)
                ZStack {
                    Rectangle()
                        .fill(Color.white)
                        .shadow(radius: 2)
                        .opacity(0.5)
                    TypeView(pokemon: pokemon)
                }
                    .frame(maxWidth: .infinity)
            }
        }    
    }
}



