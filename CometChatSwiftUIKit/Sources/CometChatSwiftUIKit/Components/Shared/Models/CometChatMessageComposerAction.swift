//
//  CometChatMessageComposerAction.swift
//  CometChatSwiftUIKit
//
//  Created by Sampada Shankar on 19/09/25.
//

import Foundation
import SwiftUI

public struct CometChatMessageComposerAction: Identifiable, Hashable {
    
    public var id: String
    public var text: String?
    public var startIcon: Image?
    public var endIcon: Image?
    public var startIconTint: Color?
    public var endIconTint: Color?
    public var textColor: Color?
    public var textFont: Font?
    public var backgroundColor: Color?
    public var cornerRadius: CGFloat?
    public var borderWidth: CGFloat?
    public var borderColor: Color?
    public var onActionClick: (() -> Void)?
    
    public init(
        id: String,
        text: String? = nil,
        startIcon: Image? = nil,
        endIcon: Image? = nil,
        startIconTint: Color? = nil,
        endIconTint: Color? = nil,
        textColor: Color? = nil,
        textFont: Font? = nil,
        backgroundColor: Color? = nil,
        cornerRadius: CGFloat? = nil,
        borderWidth: CGFloat? = nil,
        borderColor: Color? = nil,
        onActionClick: (() -> Void)? = nil
    ) {
        self.id = id
        self.text = text
        self.startIcon = startIcon
        self.endIcon = endIcon
        self.startIconTint = startIconTint
        self.endIconTint = endIconTint
        self.textColor = textColor
        self.textFont = textFont
        self.backgroundColor = backgroundColor
        self.cornerRadius = cornerRadius
        self.borderWidth = borderWidth
        self.borderColor = borderColor
        self.onActionClick = onActionClick
    }
    
    // MARK: - Equatable
    public static func == (lhs: CometChatMessageComposerAction, rhs: CometChatMessageComposerAction) -> Bool {
        return lhs.id == rhs.id &&
               lhs.text == rhs.text &&
               lhs.startIconTint == rhs.startIconTint &&
               lhs.endIconTint == rhs.endIconTint &&
               lhs.textColor == rhs.textColor &&
               lhs.backgroundColor == rhs.backgroundColor &&
               lhs.cornerRadius == rhs.cornerRadius &&
               lhs.borderWidth == rhs.borderWidth &&
               lhs.borderColor == rhs.borderColor
    }
    
    // MARK: - Hashable
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
        hasher.combine(text)
        hasher.combine(startIconTint)
        hasher.combine(endIconTint)
        hasher.combine(textColor)
        hasher.combine(backgroundColor)
        hasher.combine(cornerRadius)
        hasher.combine(borderWidth)
        hasher.combine(borderColor)
    }
}

