//
//  PokemonTypeModel.swift
//  PokemonWidgetExtension
//
//  Created by Kateryna BRYLINSKA on 17/01/2024.
//

import Foundation

struct PokemonTypeModel: Codable, Hashable {
    let id: Int
    let name: String
    let image: String
    let englishName: String
}

extension PokemonTypeModel {
    func mapToEntity() -> PokemonTypeEntity {
        PokemonTypeEntity(id: id, name: name, image: image, englishName: englishName.capitalized)
    }
}
