//
//  CometChatConversationEvents.swift
//  CometChatSwiftUIKit
//
//  Created by Sampada Shankar on 11/09/25.
//

import Foundation
import SwiftUI
import CometChatSDK

@MainActor
public final class CometChatConversationEvents: ObservableObject {
    
    // MARK: - Published state (for driving UI)
    @Published public private(set) var lastConversation: Conversation?
    @Published public private(set) var lastEvent: String = ""
    
    // MARK: - Closures for event handling
    public var onConversationDeleted: ((Conversation) -> Void)?
    
    // MARK: - Deprecated closures (optional, for migration)
    public var onConversationDeleteLegacy: ((Conversation) -> Void)?
    
    // MARK: - Singleton-style shared instance
    public static let shared = CometChatConversationEvents()
    
    private init() {}
    
    // MARK: - Modern Event
    public func ccConversationDeleted(conversation: Conversation) {
        lastConversation = conversation
        lastEvent = "Conversation Deleted"
        onConversationDeleted?(conversation)
    }
    
    // MARK: - Deprecated Event
    @available(*, deprecated, message: "Use `ccConversationDeleted(conversation:)` instead")
    public func emitConversationDelete(conversation: Conversation) {
        lastConversation = conversation
        lastEvent = "Conversation Deleted (Deprecated)"
        onConversationDeleteLegacy?(conversation)
    }
}
