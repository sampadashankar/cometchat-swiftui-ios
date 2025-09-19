//
//  MentionTextStyle.swift
//  CometChatSwiftUIKit
//
//  Created by Sampada Shankar on 19/09/25.
//

import Foundation
import SwiftUI

@MainActor public struct MentionTextStyle: Sendable {
    // Theme reference
    public var theme: CometChatTheme

    // Fonts
    public var textFont: Font
    public var loggedInUserTextFont: Font

    public init(
        theme: CometChatTheme = .default,
        textFont: Font? = nil,
        loggedInUserTextFont: Font? = nil
    ) {
        self.theme = theme
        // Safely compute defaults inside body (allowed to reference internal types)
        self.textFont = textFont ?? CometChatTypography.font(for: .body, weight: .regular)
        self.loggedInUserTextFont = loggedInUserTextFont ?? CometChatTypography.font(for: .body, weight: .regular)
    }

    /// Normal mention styling
    public func getTextAttributes() -> AttributeContainer {
        var container = AttributeContainer()
        container.foregroundColor = theme.primary
        container.font = textFont
        container.backgroundColor = theme.primary.opacity(0.2)
        return container
    }

    /// Logged-in user mention styling
    public func getLoggedInUserTextAttributes() -> AttributeContainer {
        var container = AttributeContainer()
        container.foregroundColor = theme.warning
        container.font = loggedInUserTextFont
        container.backgroundColor = theme.warning.opacity(0.2)
        return container
    }
}
