//
//  TypeView.swift
//  PokemonWidgetExtension
//
//  Created by Kateryna BRYLINSKA on 17/01/2024.
//

import SwiftUI

struct TypeView: View {
    let pokemon: PokemonEntity
    
    var body: some View {
            VStack (alignment: .center) {
                HStack {
                    Text("Types:")
                        .font(.title)
                        .fontWeight(.regular)
                        .foregroundStyle(Color.black)
                        .opacity(0.8)
                }
                VStack(alignment: .leading) {
                    ForEach(pokemon.apiTypes, id: \.self) { type in
                        HStack {
                            Image(type.name)
                                .resizable()
                                .frame(width: 20, height: 20)
                                .aspectRatio(contentMode: .fit)
                            
                            Text(type.name)
                                .foregroundStyle(Color(UIColor.darkGray))
                        }
                    }
                }
            }.alignmentGuide(HorizontalAlignment.center) { _ in  50 }
    }
}
