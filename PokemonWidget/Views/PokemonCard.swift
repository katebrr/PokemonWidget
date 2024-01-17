//
//  PokemonCard.swift
//  PokemonWidgetExtension
//
//  Created by Kateryna BRYLINSKA on 17/01/2024.
//

import SwiftUI

struct PokemonCard: View {
    
    let pokemon: PokemonEntity
    let pokemonImage: Image?
    let colorCard: Color
    let colorGen: Color
    let imageSize: CGFloat
    
    var body: some View {
        ZStack {
            Rectangle()
                .fill(colorCard)
                .cornerRadius(10)
                .shadow(radius: 2)
                .opacity(0.6)
            HStack(alignment: .bottom) {
                if pokemonImage != nil {
                    pokemonImage!
                        .resizable()
                        .scaledToFit()
                        .frame(width: imageSize, height: imageSize)
                        
                } else {
                    Image(systemName: "error")
                }
                
                Spacer()
                VStack(alignment: .center) {
                        Text("GEN:")
                            .font(.system(size: 10))
                            .lineLimit(1)
                            .minimumScaleFactor(0.5)
                        Text("\(pokemon.apiGeneration)")
                            .font(.largeTitle)
                            .foregroundStyle(colorGen)
                            .opacity(0.3)
                }
            }
            .padding()
        }
    }
}
