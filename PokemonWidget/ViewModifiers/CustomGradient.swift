//
//  CustomGradient.swift
//  PokemonWidgetExtension
//
//  Created by Kateryna BRYLINSKA on 17/01/2024.
//

import SwiftUI

struct CustomGradient: ViewModifier {
    func body(content: Content) -> some View {
            content
            .containerBackground(for: .widget) {
            let colors = [Color(red: 0.8, green: 0, blue: 0), Color.red, Color.orange, Color.yellow, Color.white]
            LinearGradient(colors: colors, startPoint: .bottom, endPoint: .top)
        }
    }
}
