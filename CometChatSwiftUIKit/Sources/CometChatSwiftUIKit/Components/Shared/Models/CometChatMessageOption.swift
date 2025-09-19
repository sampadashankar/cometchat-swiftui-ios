//
//  CometChatMessageOption.swift
//  CometChatSwiftUIKit
//
//  Created by Sampada Shankar on 19/09/25.
//

import Foundation
import SwiftUI
import CometChatSDK

// MARK: - SwiftUI Style
public struct MessageOptionStyle: Equatable, Hashable, Sendable {
    public var imageTintColor: Color
    public var backgroundColor: Color
    public var titleColor: Color
    public var titleFont: Font
    
    public init(
        imageTintColor: Color = Color.primary,
        backgroundColor: Color = Color(.systemGray6).opacity(0.8),
        titleColor: Color = Color.primary,
        titleFont: Font = .body
    ) {
        self.imageTintColor = imageTintColor
        self.backgroundColor = backgroundColor
        self.titleColor = titleColor
        self.titleFont = titleFont
    }
}

// MARK: - SwiftUI Model
public struct CometChatMessageOption: Identifiable, Hashable {
    
    public let id: String
    public let title: String
    public let icon: Image?
    public let packageName: String? = "com.cometchat.swiftuikit"
    public let overrideDefaultAction: Bool = false
    public var onItemClick: ((_ message: BaseMessage?) -> Void)?
    public var style: MessageOptionStyle
    
    public init(
        id: String,
        title: String,
        icon: Image? = nil,
        style: MessageOptionStyle = MessageOptionStyle(),
        onItemClick: ((_ message: BaseMessage?) -> Void)? = nil
    ) {
        self.id = id
        self.title = title
        self.icon = icon
        self.onItemClick = onItemClick
        self.style = style
    }
}

// MARK: - Equatable
extension CometChatMessageOption: Equatable {
    public static func == (lhs: CometChatMessageOption, rhs: CometChatMessageOption) -> Bool {
        lhs.id == rhs.id &&
        lhs.title == rhs.title &&
        lhs.style == rhs.style
        // ignoring closure + icon comparison
    }
}

extension CometChatMessageOption { // manual Hashable
    public func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
}

// MARK: - Example SwiftUI View for Option
public struct MessageOptionButton: View {
    public let option: CometChatMessageOption
    public let message: BaseMessage?
    
    public var body: some View {
        Button(action: {
            option.onItemClick?(message)
        }) {
            HStack(spacing: 8) {
                if let icon = option.icon {
                    icon
                        .renderingMode(.template)
                        .foregroundColor(option.style.imageTintColor)
                }
                Text(option.title)
                    .font(option.style.titleFont)
                    .foregroundColor(option.style.titleColor)
            }
            .padding(.vertical, 6)
            .padding(.horizontal, 12)
            .background(option.style.backgroundColor)
            .cornerRadius(8)
        }
        .buttonStyle(.plain)
    }
}
