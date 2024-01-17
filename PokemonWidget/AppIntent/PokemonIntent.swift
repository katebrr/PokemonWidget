//
//  PokemonIntent.swift
//  GameOfThronesWidgetExtension
//
//  Created by Kateryna BRYLINSKA on 15/01/2024.
//

import WidgetKit
import AppIntents

struct PokemonConfigAppIntent: AppIntent, WidgetConfigurationIntent {
    
    static var title: LocalizedStringResource = "Configuratin to choose pokemon"
    static var description = IntentDescription("This is a pokemon widget.")
    
    @Parameter(title: "Select type")
    var pokemonType: PokemonTypeEntity?
    
    @Parameter(title: "Select pokemon")
    var pokemon: PokemonEntity
    
    static var parameterSummary: some ParameterSummary {
        When(widgetFamily: .notEqualTo, .systemSmall) {
            Summary("To chose your favorite \(\.$pokemonType)")
            {
                               \.$pokemon
           }
        } otherwise: {
            Summary("To chose your favorite \(\.$pokemon)")
        }
    }
}
