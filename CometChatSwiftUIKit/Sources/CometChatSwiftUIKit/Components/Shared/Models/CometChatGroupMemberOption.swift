//
//  CometChatGroupMemberOption.swift
//  CometChatSwiftUIKit
//
//  Created by Sampada Shankar on 19/09/25.
//

import Foundation
import SwiftUI
import CometChatSDK

public protocol CometChatOptionProtocol: Identifiable, Hashable, Equatable {
    var id: String { get }
    var title: String? { get set }
    var icon: Image? { get set }
    var titleColor: Color? { get set }
    var titleFont: Font? { get set }
    var iconTint: Color? { get set }
    var backgroundColor: Color? { get set }
}

// MARK: - User Option
public struct CometChatUserOption: CometChatOptionProtocol {
    public var id: String
    public var title: String?
    public var icon: Image?
    public var titleColor: Color?
    public var titleFont: Font?
    public var iconTint: Color?
    public var backgroundColor: Color?
    
    public var onClick: ((_ user: User?, _ section: Int, _ option: CometChatUserOption, _ context: Any?) -> Void)?
    
    public init(
        id: String = UUID().uuidString,
        title: String? = nil,
        icon: Image? = nil,
        titleColor: Color? = nil,
        titleFont: Font? = nil,
        iconTint: Color? = nil,
        backgroundColor: Color? = nil,
        onClick: ((_ user: User?, _ section: Int, _ option: CometChatUserOption, _ context: Any?) -> Void)? = nil
    ) {
        self.id = id
        self.title = title
        self.icon = icon
        self.titleColor = titleColor
        self.titleFont = titleFont
        self.iconTint = iconTint
        self.backgroundColor = backgroundColor
        self.onClick = onClick
    }
}

// MARK: - Conversation Option
public struct CometChatConversationOption: CometChatOptionProtocol {
    public var id: String
    public var title: String?
    public var icon: Image?
    public var titleColor: Color?
    public var titleFont: Font?
    public var iconTint: Color?
    public var backgroundColor: Color?
    
    public var onClick: ((_ user: User?, _ section: Int, _ option: CometChatConversationOption, _ context: Any?) -> Void)?
    
    public init(
        id: String = UUID().uuidString,
        title: String? = nil,
        icon: Image? = nil,
        titleColor: Color? = nil,
        titleFont: Font? = nil,
        iconTint: Color? = nil,
        backgroundColor: Color? = nil,
        onClick: ((_ user: User?, _ section: Int, _ option: CometChatConversationOption, _ context: Any?) -> Void)? = nil
    ) {
        self.id = id
        self.title = title
        self.icon = icon
        self.titleColor = titleColor
        self.titleFont = titleFont
        self.iconTint = iconTint
        self.backgroundColor = backgroundColor
        self.onClick = onClick
    }
}

// MARK: - Group Option
public struct CometChatGroupOption: CometChatOptionProtocol {
    public var id: String
    public var title: String?
    public var icon: Image?
    public var titleColor: Color?
    public var titleFont: Font?
    public var iconTint: Color?
    public var backgroundColor: Color?
    
    public var onClick: ((_ group: CometChatSDK.Group?, _ section: Int, _ option: CometChatGroupOption, _ context: Any?) -> Void)?
    
    public init(
        id: String = UUID().uuidString,
        title: String? = nil,
        icon: Image? = nil,
        titleColor: Color? = nil,
        titleFont: Font? = nil,
        iconTint: Color? = nil,
        backgroundColor: Color? = nil,
        onClick: ((_ group: CometChatSDK.Group?, _ section: Int, _ option: CometChatGroupOption, _ context: Any?) -> Void)? = nil
    ) {
        self.id = id
        self.title = title
        self.icon = icon
        self.titleColor = titleColor
        self.titleFont = titleFont
        self.iconTint = iconTint
        self.backgroundColor = backgroundColor
        self.onClick = onClick
    }
}

// MARK: - Call Option
public struct CometChatCallOption: CometChatOptionProtocol {
    public var id: String
    public var title: String?
    public var icon: Image?
    public var titleColor: Color?
    public var titleFont: Font?
    public var iconTint: Color?
    public var backgroundColor: Color?
    
    public var onClick: ((_ call: BaseMessage?, _ section: Int, _ option: CometChatCallOption, _ context: Any?) -> Void)?
    
    public init(
        id: String = UUID().uuidString,
        title: String? = nil,
        icon: Image? = nil,
        titleColor: Color? = nil,
        titleFont: Font? = nil,
        iconTint: Color? = nil,
        backgroundColor: Color? = nil,
        onClick: ((_ call: BaseMessage?, _ section: Int, _ option: CometChatCallOption, _ context: Any?) -> Void)? = nil
    ) {
        self.id = id
        self.title = title
        self.icon = icon
        self.titleColor = titleColor
        self.titleFont = titleFont
        self.iconTint = iconTint
        self.backgroundColor = backgroundColor
        self.onClick = onClick
    }
}

// MARK: - Group Member Option
public struct CometChatGroupMemberOption: CometChatOptionProtocol {
    public var id: String
    public var title: String?
    public var icon: Image?
    public var titleColor: Color?
    public var titleFont: Font?
    public var iconTint: Color?
    public var backgroundColor: Color?
    
    public var onClick: ((_ groupMember: GroupMember?, _ group: CometChatSDK.Group?, _ section: Int, _ option: CometChatGroupMemberOption, _ context: Any?) -> Void)?
    
    public init(
        id: String = UUID().uuidString,
        title: String? = nil,
        icon: Image? = nil,
        titleColor: Color? = nil,
        titleFont: Font? = nil,
        iconTint: Color? = nil,
        backgroundColor: Color? = nil,
        onClick: ((_ groupMember: GroupMember?, _ group: CometChatSDK.Group?, _ section: Int, _ option: CometChatGroupMemberOption, _ context: Any?) -> Void)? = nil
    ) {
        self.id = id
        self.title = title
        self.icon = icon
        self.titleColor = titleColor
        self.titleFont = titleFont
        self.iconTint = iconTint
        self.backgroundColor = backgroundColor
        self.onClick = onClick
    }
}

extension CometChatUserOption {
    public static func == (lhs: CometChatUserOption, rhs: CometChatUserOption) -> Bool { lhs.id == rhs.id }
    public func hash(into hasher: inout Hasher) { hasher.combine(id) }
}
extension CometChatConversationOption {
    public static func == (lhs: CometChatConversationOption, rhs: CometChatConversationOption) -> Bool { lhs.id == rhs.id }
    public func hash(into hasher: inout Hasher) { hasher.combine(id) }
}
extension CometChatGroupOption {
    public static func == (lhs: CometChatGroupOption, rhs: CometChatGroupOption) -> Bool { lhs.id == rhs.id }
    public func hash(into hasher: inout Hasher) { hasher.combine(id) }
}
extension CometChatCallOption {
    public static func == (lhs: CometChatCallOption, rhs: CometChatCallOption) -> Bool { lhs.id == rhs.id }
    public func hash(into hasher: inout Hasher) { hasher.combine(id) }
}
extension CometChatGroupMemberOption {
    public static func == (lhs: CometChatGroupMemberOption, rhs: CometChatGroupMemberOption) -> Bool { lhs.id == rhs.id }
    public func hash(into hasher: inout Hasher) { hasher.combine(id) }
}
