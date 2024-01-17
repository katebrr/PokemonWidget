//  PokemonTilmelineProvider.swift
//  GameOfThronesWidgetExtension
//
//  Created by Kateryna BRYLINSKA on 15/01/2024.
//

import Foundation
import WidgetKit
import SwiftUI

struct PokemonTilmelineProvider: AppIntentTimelineProvider {
    typealias Entry = PokemonEntry
    
    typealias Intent = PokemonConfigAppIntent
    
    func placeholder(in context: Context) -> PokemonEntry {
        Entry(date: Date(), pokemon:
                PokemonEntity(
            id: 252,
            name: "Arcko",
            image: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/other/official-artwork/252.png",
            sprite: "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/252.png",
            slug: "Arcko",
            stats: PokemonStats(HP: 40, attack: 45, defense: 35, special_attack: 65, special_defense: 55, speed: 70),
            apiTypes: [PokemonType( name: "Plante", image: "https://static.wikia.nocookie.net/pokemongo/images/c/c5/Grass.png")],
            apiGeneration: 3), image: Image(systemName: "multiply.circle.fill")        )
    }
    
    func snapshot(for configuration: PokemonConfigAppIntent, in context: Context) async -> PokemonEntry {
        let image = await PokemonManager().fetchImageFromURL(urlString: configuration.pokemon.image)
       return  Entry(date: Date(), pokemon: configuration.pokemon, image: image)
    }
    
    func timeline(for configuration: PokemonConfigAppIntent, in context: Context) async -> Timeline<PokemonEntry> {
        
        let image = await PokemonManager().fetchImageFromURL(urlString: configuration.pokemon.image)
        
        let entry = PokemonEntry(date: Date(), pokemon: configuration.pokemon, image: image)
        return Timeline(entries: [entry], policy: .never)
    }
}
