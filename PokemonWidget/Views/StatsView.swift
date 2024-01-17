//
//  StatsView.swift
//  PokemonWidgetExtension
//
//  Created by Kateryna BRYLINSKA on 17/01/2024.
//

import SwiftUI

struct StatsView: View {
    
    let pokemon: PokemonEntity
    
    var stats: PokemonStats {
        pokemon.stats
    }
    var body: some View {
        VStack {
            SimpleStat(icon: "heart",  statName: "HP", statValue: stats.HP)
            SimpleStat(icon: "bolt",  statName: "Attack", statValue: stats.attack)
            SimpleStat(icon: "shield",  statName: "Defense", statValue: stats.defense)
            SimpleStat(icon: "sparkles",  statName: "SA", statValue: stats.special_attack)
            SimpleStat(icon: "bolt.shield",  statName: "SD", statValue: stats.special_defense)
            SimpleStat(icon: "hare",  statName: "Speed", statValue: stats.speed)
        }
        
    }
}

struct SimpleStat: View {
    
    let icon: String
    let statName: String
    let statValue: Int
    
    var body: some View {
        HStack {
                HStack {
                    Image(systemName: icon)
                        .foregroundStyle(Color(uiColor: .gray))
                        .frame(width: 20)
                    Text(statName)
                        .foregroundStyle(Color.white)
                }
                .font(.footnote)
                .frame(maxWidth: .infinity, alignment: .leading)
            HStack {
                Text(statValue.description)
                    .foregroundStyle(Color.white)
                    .font(.footnote)
            }
            ProgressView(value: Float(statValue)/160)
                .tint(Color.white)
                .frame(maxWidth: .infinity)
        }.padding(.horizontal, 10)
    }
}
