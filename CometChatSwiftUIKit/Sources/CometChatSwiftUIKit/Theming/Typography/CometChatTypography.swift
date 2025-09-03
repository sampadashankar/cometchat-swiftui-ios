//
//  CometChatTypography.swift
//  CometChatSwiftUIKit
//
//  Created by Sampada Shankar on 28/08/25.
//

import Foundation
import SwiftUI

// MARK: - Typography Manager
@MainActor
struct CometChatTypography {
    
    // MARK: - Font Types Enum
    enum FontType {
        case title
        case heading1
        case heading2
        case heading3
        case heading4
        case body
        case caption1
        case caption2
        case button
        case link
    }
    
    // MARK: - Font Weights Enum
    enum FontWeight {
        case regular
        case medium
        case bold
    }
    
    // MARK: - Configuration
    private(set) static var customFontName: String? = nil
    
    // MARK: - Public Method to Set Custom Font
       static func setCustomFont(name: String?) {
           guard let name = name, !name.isEmpty else {
               // If nil or empty string → fallback to system font
               customFontName = nil
               print("⚠️ [CometChatTypography] Using default system font.")
               return
           }
           
           // Validate that at least one variant of the font exists
           if UIFont(name: name, size: 16) != nil ||
              UIFont(name: "\(name)-Regular", size: 16) != nil ||
              UIFont(name: "\(name)-Medium", size: 16) != nil ||
              UIFont(name: "\(name)-Bold", size: 16) != nil {
               
               customFontName = name
               print("✅ [CometChatTypography] Custom font set to: \(name)")
           } else {
               customFontName = nil
               print("⚠️ [CometChatTypography] Font '\(name)' not found. Falling back to system font.")
           }
       }
    
    // MARK: - Public Method
    static func font(for type: FontType, weight: FontWeight = .regular) -> Font {
        let fontSize = fontSize(for: type)
        let swiftUIFontWeight = swiftUIFontWeight(for: weight)
        
        if let customFontName = customFontName, !customFontName.isEmpty {
            // Try loading custom font with weight variation if available
            let weightSuffix = customFontWeightSuffix(for: weight)
            let customFontFullName = "\(customFontName)\(weightSuffix)"
            
            if UIFont(name: customFontFullName, size: fontSize) != nil {
                return Font.custom(customFontFullName, size: fontSize)
            }
            
            // Fallback: use base custom font name without weight suffix
            if UIFont(name: customFontName, size: fontSize) != nil {
                return Font.custom(customFontName, size: fontSize)
            }
        }
        
        // Default: Use System Font
        return Font.system(size: fontSize, weight: swiftUIFontWeight)
    }
    
    // MARK: - Font Sizes Mapping
    private static func fontSize(for type: FontType) -> CGFloat {
        switch type {
        case .title:     return 32
        case .heading1:  return 24
        case .heading2:  return 20
        case .heading3:  return 18
        case .heading4:  return 16
        case .body:      return 14
        case .caption1:  return 12
        case .caption2:  return 10
        case .button:    return 14
        case .link:      return 14
        }
    }
    
    // MARK: - Font Weight Mapping
    private static func swiftUIFontWeight(for weight: FontWeight) -> Font.Weight {
        switch weight {
        case .regular: return .regular
        case .medium:  return .medium
        case .bold:    return .bold
        }
    }
    
    // MARK: - Custom Font Weight Suffix Helper
    private static func customFontWeightSuffix(for weight: FontWeight) -> String {
        switch weight {
        case .regular: return "-Regular"
        case .medium:  return "-Medium"
        case .bold:    return "-Bold"
        }
    }
}

