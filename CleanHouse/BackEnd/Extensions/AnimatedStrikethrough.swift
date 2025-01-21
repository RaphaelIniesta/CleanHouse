//
//  AnimatedStrikethrough.swift
//  CleanHouse
//
//  Created by Raphael Iniesta Reis on 21/01/25.
//

import Foundation
import SwiftUI

extension Text {
    func animatedStrikeThrough(_ isActive: Bool, pattern: Text.LineStyle.Pattern = .solid, textColor: Color = .black, color: Color = .black) -> some View {
        
        self
        // Esse muda a cor do texto exibido
            .foregroundStyle(textColor)
            .overlay(alignment: .leading) {
                self
                    .foregroundStyle(.clear)
                // E esse muda a cor do traço do texto
                    .strikethrough(isActive, pattern: pattern, color: color)
                    .scaleEffect(x: isActive ? 1 : 0, anchor: .leading)
            }
        
    }
}
