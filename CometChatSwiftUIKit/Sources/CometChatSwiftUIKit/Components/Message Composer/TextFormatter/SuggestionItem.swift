//
//  SuggestionItem.swift
//  CometChatSwiftUIKit
//
//  Created by Sampada Shankar on 19/09/25.
//

import Foundation
import SwiftUI
import CometChatSDK

public struct SuggestionItem: Identifiable, Hashable {
    
    public var id: String { uid ?? UUID().uuidString }
    
    public var uid: String?
    public var name: String?
    public var visibleText: String?
    public var underlyingText: String?
    public var status: UserStatus = .offline
    
    public var data: [String: Any]?
    
    public var leftIconUrl: String?
    public var hideLeftIcon: Bool = false
    
    
    public var leftIcon: Image?
    
    
    public var textColor: Color = .primary
    public var backgroundColor: Color = .clear
    public var font: Font = .body
    
    public init(
        uid: String? = nil,
        name: String? = nil,
        leftIconUrl: String? = nil,
        visibleText: String? = nil,
        underlyingText: String? = nil,
        data: [String : Any]? = nil,
        status: UserStatus = .offline,
        hideLeftIcon: Bool = false,
        leftIcon: Image? = nil,
        textColor: Color = .primary,
        backgroundColor: Color = .clear,
        font: Font = .body
    ) {
        self.uid = uid
        self.name = name
        self.leftIconUrl = leftIconUrl
        self.visibleText = visibleText
        self.underlyingText = underlyingText
        self.data = data
        self.status = status
        self.hideLeftIcon = hideLeftIcon
        self.leftIcon = leftIcon
        self.textColor = textColor
        self.backgroundColor = backgroundColor
        self.font = font
    }
    
    
    public static func == (lhs: SuggestionItem, rhs: SuggestionItem) -> Bool {
        lhs.uid == rhs.uid &&
        lhs.name == rhs.name &&
        lhs.visibleText == rhs.visibleText &&
        lhs.underlyingText == rhs.underlyingText &&
        lhs.status == rhs.status &&
        lhs.leftIconUrl == rhs.leftIconUrl &&
        lhs.hideLeftIcon == rhs.hideLeftIcon
    }
    
    public func hash(into hasher: inout Hasher) {
        hasher.combine(uid)
        hasher.combine(name)
        hasher.combine(visibleText)
        hasher.combine(underlyingText)
        hasher.combine(status.rawValue)
        hasher.combine(leftIconUrl)
        hasher.combine(hideLeftIcon)
    }
}
