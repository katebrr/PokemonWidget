//
//  PokemonManager.swift
//  GameOfThronesWidgetExtension
//
//  Created by Kateryna BRYLINSKA on 15/01/2024.
//

import Foundation
import SwiftUI



final public class PokemonManager {
    
    let stringUrlBase = "https://pokebuildapi.fr/api/v1"
    
    
    func fetchPokemons() async throws -> [PokemonModel] {
        
        var pokemons: [PokemonModel] = []
        
        let stringUrl = "\(stringUrlBase)/pokemon/generation/1"
        
        do {
            guard let url = URL(string: stringUrl) else { throw DataManagerError.invalidURL }
            let (data, response) = try await URLSession.shared.data(from: url)
            if let responseHTTP = response as? HTTPURLResponse {
                guard responseHTTP.statusCode >= 200 && responseHTTP.statusCode < 300 else { throw DataManagerError.networkError(URLError(.badServerResponse)) }
            }
            let decodedResponse = try JSONDecoder().decode([PokemonModel].self, from: data)
            pokemons = decodedResponse
            
        } catch DataManagerError.invalidURL {
            print(DataManagerError.invalidURL.localizedDescription)
        } catch DataManagerError.networkError {
            print(DataManagerError.networkError(URLError(.badServerResponse)).localizedDescription)
        } catch let error {
            print(DataManagerError.parsingError(error).localizedDescription)
        }
        return pokemons
    }
    
    func fetchTypes() async throws -> [PokemonTypeModel] {
        var types: [PokemonTypeModel] = []
        
        let stringUrl = "\(stringUrlBase)/types"
        
        do {
            guard let url = URL(string: stringUrl) else { throw DataManagerError.invalidURL }
            let (data, response) = try await URLSession.shared.data(from: url)
            if let responseHTTP = response as? HTTPURLResponse {
                guard responseHTTP.statusCode >= 200 && responseHTTP.statusCode < 300 else { throw DataManagerError.networkError(URLError(.badServerResponse)) }
            }
            let decodedResponse = try JSONDecoder().decode([PokemonTypeModel].self, from: data)
            types = decodedResponse
            
        } catch DataManagerError.invalidURL {
            print(DataManagerError.invalidURL.localizedDescription)
        } catch DataManagerError.networkError {
            print(DataManagerError.networkError(URLError(.badServerResponse)).localizedDescription)
        } catch let error {
            print(DataManagerError.parsingError(error).localizedDescription)
        }
        
        return types
    }

    
    func fetchImageFromURL(urlString: String) async -> Image? {
        guard let url = URL(string: urlString) else { return nil }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            guard let uiImage = UIImage(data: data) else { return nil }
            let image = Image(uiImage: uiImage)
            return image 
        } catch {
            print("Error fetching image: \(error)")
            return nil
        }
    }
}
