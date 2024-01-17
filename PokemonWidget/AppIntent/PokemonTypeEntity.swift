//
//  PokemonTypeEntity.swift
//  PokemonWidgetExtension
//
//  Created by Kateryna BRYLINSKA on 16/01/2024.
//

import SwiftUI
import WidgetKit
import AppIntents


struct PokemonTypeEntity: AppEntity {
    let id: Int
    let name: String
    let image: String
    var englishName: String
    
    static var typeDisplayRepresentation: TypeDisplayRepresentation = "Pokemon Type"
    static var defaultQuery = PokemonTypesQuery()
    
    var displayRepresentation: DisplayRepresentation {
        DisplayRepresentation(title: "\(englishName)")
    }
    
    static func fetchAllTypes(completion: @escaping ([PokemonTypeEntity]?) -> Void) async {
       
            do {
                let types = try await PokemonManager().fetchTypes()
                var typesEntities = types.compactMap { $0.mapToEntity() }
                typesEntities.insert(PokemonTypeEntity(id: 890458, name: "Any", image: "", englishName: "Any"), at: 0)
                completion(typesEntities)
            } catch {
                print("Error fetching pokemons: \(error)")
                completion(nil)
            }
    }

}

struct PokemonTypesQuery: EntityQuery {
    
    func entities(for identifiers: [PokemonTypeEntity.ID]) async throws -> [PokemonTypeEntity] {
        
        var pokemonTypes: [PokemonTypeEntity] = []
        
        await PokemonTypeEntity.fetchAllTypes { fetched in
            if let typesFetched = fetched {
                pokemonTypes = typesFetched
            }
        }
        guard let selectedId = identifiers.first,
              let pokemonType = pokemonTypes.first(where: { $0.id == selectedId })
        else {
            return []
        }
        return [pokemonType]
    }
    
    func suggestedEntities() async throws -> [PokemonTypeEntity] {

        var pokemonTypes: [PokemonTypeEntity] = []
        
        await PokemonTypeEntity.fetchAllTypes { fetched in
            if let typesFetched = fetched {
                pokemonTypes = typesFetched
            }
        }
        
        return pokemonTypes
    }
    
    func defaultResult() async -> PokemonTypeEntity? {
        try? await suggestedEntities().first
    }
}
