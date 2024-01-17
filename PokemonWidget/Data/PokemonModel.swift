//
//  PokemonModel.swift
//  GameOfThronesWidgetExtension
//
//  Created by Kateryna BRYLINSKA on 15/01/2024.
//

import Foundation

struct PokemonModel: Codable, Identifiable {
    let id: Int
    let name: String
    let image: String
    let sprite: String
    let slug: String
    let stats: PokemonStats
    let apiTypes: [PokemonType]
    let apiGeneration: Int
}

struct PokemonStats: Codable {
    let HP: Int
    let attack: Int
    let defense: Int
    let special_attack: Int
    let special_defense: Int
    let speed: Int
}

struct PokemonType: Codable, Hashable {
    let name: String
    let image: String

}

extension PokemonModel {
    func mapToEntity() -> PokemonEntity {
        PokemonEntity(id: id, name: name, image: image, sprite: sprite, slug: slug, stats: stats, apiTypes: apiTypes, apiGeneration: apiGeneration)
    }
}

