//
//  PokemonEntry.swift
//  GameOfThronesWidgetExtension
//
//  Created by Kateryna BRYLINSKA on 15/01/2024.
//

import Foundation
import WidgetKit
import SwiftUI

struct PokemonEntry: TimelineEntry {
    let date: Date
    let pokemon: PokemonEntity
    let image: Image?
}
