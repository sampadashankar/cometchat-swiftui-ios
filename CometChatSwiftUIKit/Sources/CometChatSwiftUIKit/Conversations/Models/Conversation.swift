//
//  Conversation.swift
//  CometChatSwiftUIKit
//
//  Created by Sampada Shankar on 02/09/25.
//

import Foundation

public struct Conversation: Identifiable {
    public let id: UUID = UUID()
    public let name: String
    public let lastMessage: String?
    public let lastActiveTime: Date?
    public let avatarURL: String?
    public var unreadCount: Int
    
    public init(
        name: String,
        lastMessage: String? = nil,
        lastActiveTime: Date? = nil,
        avatarURL: String? = nil,
        unreadCount: Int = 0
    ) {
        self.name = name
        self.lastMessage = lastMessage
        self.lastActiveTime = lastActiveTime
        self.avatarURL = avatarURL
        self.unreadCount = unreadCount
    }
}
