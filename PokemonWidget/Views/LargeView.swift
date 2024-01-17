//
//  LargeView.swift
//  PokemonWidgetExtension
//
//  Created by Kateryna BRYLINSKA on 17/01/2024.
//

import SwiftUI

struct LargeView: View {
    
    let pokemon: PokemonEntity
    let image: Image?
    
    var body: some View {
        VStack {
            HStack(spacing: 0) {
                SmallView(pokemon: pokemon, image: image, imageSize: 80)
                    .frame(maxWidth: .infinity)
                TypeView(pokemon: pokemon)
                    .frame(maxWidth: .infinity)
            }
            .frame(maxHeight: .infinity)
            StatsView(pokemon: pokemon)
                .padding(.bottom, 16)
                .padding(.horizontal, 16)
                .frame(maxHeight: .infinity)
        }
    }
}

