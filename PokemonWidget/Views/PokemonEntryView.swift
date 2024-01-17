//
//  PokemonEntryView.swift
//  GameOfThronesWidgetExtension
//
//  Created by Kateryna BRYLINSKA on 15/01/2024.
//

import SwiftUI
import WidgetKit

struct PokemonEntryView : View {
    var entry: PokemonTilmelineProvider.Entry
    
    private var pokemon: PokemonEntity {
        entry.pokemon
    }

    @Environment(\.widgetFamily) var widgetFamily

    var body: some View {
        switch widgetFamily {
        case .systemSmall:
            SmallView(pokemon: pokemon, image: entry.image, imageSize: 60)
                .modifier(CustomGradient())
        case .systemMedium:
            MediumView(pokemon: pokemon, image: entry.image)
                .modifier(CustomGradient())
        case .systemLarge:
            LargeView(pokemon: pokemon, image: entry.image)
                .modifier(CustomGradient())
      default:
            SmallView(pokemon: pokemon, image: entry.image, imageSize: 60)
        }
    }
}
