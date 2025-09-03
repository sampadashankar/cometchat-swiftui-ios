//
//  CometChatTheme.swift
//  CometChatSwiftUIKit
//
//  Created by Sampada Shankar on 02/09/25.
//

import Foundation
import SwiftUI

public struct CometChatTheme: Sendable {
    
    // MARK: - Primary Colors
    public var primary: Color
    public var white: Color
    public var black: Color
    
    // MARK: - Extended Primary Colors
    public var primary50: Color
    public var primary100: Color
    public var primary200: Color
    public var primary300: Color
    public var primary400: Color
    public var primary500: Color
    public var primary600: Color
    public var primary700: Color
    public var primary800: Color
    public var primary900: Color
    
    // MARK: - Neutral Colors
    public var neutral50: Color
    public var neutral100: Color
    public var neutral200: Color
    public var neutral300: Color
    public var neutral400: Color
    public var neutral500: Color
    public var neutral600: Color
    public var neutral700: Color
    public var neutral800: Color
    public var neutral900: Color
    
    // MARK: - Background Colors
    public var background01: Color
    public var background02: Color
    public var background03: Color
    public var background04: Color
    
    // MARK: - Border Colors
    public var borderDefault: Color
    public var borderLight: Color
    public var borderDark: Color
    public var borderHighlight: Color
    
    // MARK: - Text Colors
    public var textPrimary: Color
    public var textSecondary: Color
    public var textTertiary: Color
    public var textDisabled: Color
    public var textWhite: Color
    public var textHighlight: Color
    
    // MARK: - Icon Colors
    public var iconPrimary: Color
    public var iconSecondary: Color
    public var iconTertiary: Color
    public var iconWhite: Color
    public var iconHighlight: Color
    
    // MARK: - Alerts
    public var info: Color
    public var warning: Color
    public var success: Color
    public var error: Color
    public var errorLight: Color
    
    // MARK: - Buttons
    public var buttonBackground: Color
    public var buttonText: Color
    public var buttonIcon: Color
    
    public var secondaryButtonBackground: Color
    public var secondaryButtonText: Color
    public var secondaryButtonIcon: Color
    
    public var fabButtonBackground: Color
    public var fabButtonIcon: Color
    
    // MARK: - Initializer
    public init(
        primary: Color = Color(hex: "#6852D6"),
        white: Color = Color(hex: "#FFFFFF"),
        black: Color = Color(hex: "#141414"),
        
        neutral50: Color = Color(hex: "#FFFFFF"),
        neutral100: Color = Color(hex: "#FAFAFA"),
        neutral200: Color = Color(hex: "#F5F5F5"),
        neutral300: Color = Color(hex: "#E8E8E8"),
        neutral400: Color = Color(hex: "#DCDCDC"),
        neutral500: Color = Color(hex: "#A1A1A1"),
        neutral600: Color = Color(hex: "#727272"),
        neutral700: Color = Color(hex: "#5B5B5B"),
        neutral800: Color = Color(hex: "#434343"),
        neutral900: Color = Color(hex: "#141414"),
        
        info: Color = Color(hex: "#0B7BEA"),
        warning: Color = Color(hex: "#FFAB00"),
        success: Color = Color(hex: "#09C26F"),
        error: Color = Color(hex: "#F44649"),
        errorLight: Color = Color(hex: "#F9EAEF")
    ) {
        self.primary = primary
        self.white = white
        self.black = black
        
        self.neutral50 = neutral50
        self.neutral100 = neutral100
        self.neutral200 = neutral200
        self.neutral300 = neutral300
        self.neutral400 = neutral400
        self.neutral500 = neutral500
        self.neutral600 = neutral600
        self.neutral700 = neutral700
        self.neutral800 = neutral800
        self.neutral900 = neutral900
        
        // Generate extended shades dynamically
        self.primary50  = primary.mixWithWhite(0.96)
        self.primary100 = primary.mixWithWhite(0.88)
        self.primary200 = primary.mixWithWhite(0.77)
        self.primary300 = primary.mixWithWhite(0.66)
        self.primary400 = primary.mixWithWhite(0.55)
        self.primary500 = primary.mixWithWhite(0.44)
        self.primary600 = primary.mixWithWhite(0.33)
        self.primary700 = primary.mixWithWhite(0.22)
        self.primary800 = primary.mixWithWhite(0.11)
        self.primary900 = primary.mixWithBlack(0.11)
        
        // Backgrounds
        self.background01 = neutral50
        self.background02 = neutral100
        self.background03 = neutral200
        self.background04 = neutral300
        
        // Borders
        self.borderDefault = neutral300
        self.borderLight = neutral200
        self.borderDark = neutral400
        self.borderHighlight = primary
        
        // Text colors
        self.textPrimary = neutral900
        self.textSecondary = neutral600
        self.textTertiary = neutral500
        self.textDisabled = neutral400
        self.textWhite = neutral50
        self.textHighlight = primary
        
        // Icons
        self.iconPrimary = neutral900
        self.iconSecondary = neutral500
        self.iconTertiary = neutral400
        self.iconWhite = neutral50
        self.iconHighlight = primary
        
        // Buttons
        self.buttonBackground = primary
        self.buttonText = white
        self.buttonIcon = white
        self.secondaryButtonBackground = neutral800
        self.secondaryButtonText = neutral800
        self.secondaryButtonIcon = neutral800
        self.fabButtonBackground = primary
        self.fabButtonIcon = white
        
        // Alerts
        self.info = info
        self.warning = warning
        self.success = success
        self.error = error
        self.errorLight = errorLight
    }
}


extension CometChatTheme {
    public static let `default` = CometChatTheme()
}

