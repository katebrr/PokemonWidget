//
//  PokemonWidget.swift
//  GameOfThronesWidgetExtension
//
//  Created by Kateryna BRYLINSKA on 15/01/2024.
//

import WidgetKit
import SwiftUI

struct PokemonWidget: Widget {
    let kind: String = "PokemonWidget"

    var body: some WidgetConfiguration {
        AppIntentConfiguration(kind: kind, intent: PokemonConfigAppIntent.self, provider: PokemonTilmelineProvider()) { entry in
            PokemonEntryView(entry: entry)
                
        }
        .contentMarginsDisabled()
    }
}

