//
//  NameView.swift
//  PokemonWidgetExtension
//
//  Created by Kateryna BRYLINSKA on 17/01/2024.
//

import SwiftUI

struct NameView: View {
    
    let pokemon: PokemonEntity
    
    var body: some View {
        HStack {
                Text(pokemon.name)
                    .font(.headline)
                    .fontWeight(.semibold)
                    .foregroundStyle(.white)
                    .opacity(0.8)
            }
    }
}
