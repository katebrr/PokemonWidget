//
//  PokemonEntity.swift
//  PokemonWidgetExtension
//
//  Created by Kateryna BRYLINSKA on 17/01/2024.
//

import Foundation
import AppIntents

struct PokemonEntity: AppEntity {
    
    let id: Int
    let name: String
    let image: String
    let sprite: String
    let slug: String
    let stats: PokemonStats
    let apiTypes: [PokemonType]
    let apiGeneration: Int

    
    static var typeDisplayRepresentation: TypeDisplayRepresentation = "Pokemon"
    static var defaultQuery = PokemonQuery()
    
    var displayRepresentation: DisplayRepresentation {
        DisplayRepresentation(title: "\(slug)")
    }
    
    static func fetchAllPokemons(completion: @escaping ([PokemonEntity]?) -> Void) async {
       
            do {
                let pokemons = try await PokemonManager().fetchPokemons()
                let pokemonsEntities = pokemons.compactMap { $0.mapToEntity() }
                completion(pokemonsEntities)
            } catch {
                print("Error fetching pokemons: \(error)")
                completion(nil)
            }
        
    }
}


struct PokemonQuery: EntityQuery {
    
    @IntentParameterDependency<PokemonConfigAppIntent>(
        \.$pokemonType
    )
    var pokemonConfig
    
    func entities(for identifiers: [PokemonEntity.ID]) async throws -> [PokemonEntity] {
        var pokemons: [PokemonEntity] = []
  
        guard let pokemonConfig else { return pokemons }
        let typeName = pokemonConfig.pokemonType.name
        
        await PokemonEntity.fetchAllPokemons { fetched in
                if let fetchedPokemons = fetched {
                    pokemons = fetchedPokemons.filter { identifiers.contains($0.id)}
                }
        }
        
        if typeName != "Any" {
            return pokemons.filter {$0.apiTypes.contains { $0.name == typeName }}
        } else {
            return pokemons
        }
    }
    
    func suggestedEntities() async throws -> [PokemonEntity] {
        var pokemons: [PokemonEntity] = []
        
        guard let pokemonConfig else { return pokemons }
        let typeName = pokemonConfig.pokemonType.name
        
        await PokemonEntity.fetchAllPokemons { fetched in
            if let fetchedPokemons = fetched {
                pokemons = fetchedPokemons
            }
        }

        if typeName != "Any" {
            return pokemons.filter {$0.apiTypes.contains { $0.name == typeName }}
        } else {
            return pokemons
        }
    }
    
    func defaultResult() async -> PokemonEntity? {
        try? await suggestedEntities().first
    }
}


