//
// Color+Extensions.swift
//  CometChatSwiftUIKit
//
//  Created by Sampada Shankar on 02/09/25.
//

import Foundation
import SwiftUI

extension Color {
    public init(hex: String) {
        let hex = hex.trimmingCharacters(in: .alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 6:
            (a, r, g, b) = (255, (int >> 16) & 0xFF, (int >> 8) & 0xFF, int & 0xFF)
        case 8:
            (a, r, g, b) = ((int >> 24) & 0xFF, (int >> 16) & 0xFF, (int >> 8) & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(.sRGB,
                  red: Double(r) / 255,
                  green: Double(g) / 255,
                  blue: Double(b) / 255,
                  opacity: Double(a) / 255)
    }
    
    func mixWithWhite(_ percentage: CGFloat) -> Color {
        mixWith(Color.white, percentage: percentage)
    }
    
    func mixWithBlack(_ percentage: CGFloat) -> Color {
        mixWith(Color.black, percentage: percentage)
    }
    
    private func mixWith(_ color: Color, percentage: CGFloat) -> Color {
        let uiColor1 = UIColor(self)
        let uiColor2 = UIColor(color)
        
        var r1: CGFloat = 0, g1: CGFloat = 0, b1: CGFloat = 0, a1: CGFloat = 0
        var r2: CGFloat = 0, g2: CGFloat = 0, b2: CGFloat = 0, a2: CGFloat = 0
        uiColor1.getRed(&r1, green: &g1, blue: &b1, alpha: &a1)
        uiColor2.getRed(&r2, green: &g2, blue: &b2, alpha: &a2)
        
        return Color(
            red: Double(r1 + (r2 - r1) * percentage),
            green: Double(g1 + (g2 - g1) * percentage),
            blue: Double(b1 + (b2 - b1) * percentage),
            opacity: Double(a1 + (a2 - a1) * percentage)
        )
    }
}
