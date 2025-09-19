//
//  BaseStyle.swift
//  CometChatSwiftUIKit
//
//  Created by Sampada Shankar on 19/09/25.
//

import Foundation
import SwiftUI

public struct BaseStyle: Sendable, Equatable {
    
    public var background: Color
    public var cornerRadius: CGFloat
    public var borderWidth: CGFloat
    public var borderColor: Color
    
    public init(
        background: Color = Color(.systemBackground),
        cornerRadius: CGFloat = 0,
        borderWidth: CGFloat = 0,
        borderColor: Color = Color(.systemFill)
    ) {
        self.background = background
        self.cornerRadius = cornerRadius
        self.borderWidth = borderWidth
        self.borderColor = borderColor
    }
    
    public func background(_ color: Color) -> BaseStyle {
        var copy = self
        copy.background = color
        return copy
    }
    
    public func cornerRadius(_ radius: CGFloat) -> BaseStyle {
        var copy = self
        copy.cornerRadius = radius
        return copy
    }
    
    public func borderWidth(_ width: CGFloat) -> BaseStyle {
        var copy = self
        copy.borderWidth = width
        return copy
    }
    
    public func borderColor(_ color: Color) -> BaseStyle {
        var copy = self
        copy.borderColor = color
        return copy
    }
}
