//
//  CometChatConversationEventListener.swift
//  CometChatSwiftUIKit
//
//  Created by Sampada Shankar on 11/09/25.
//

import Foundation
import SwiftUI
import CometChatSDK


@MainActor
public final class CometChatConversationEventListener: ObservableObject {
    
    // MARK: - Published state for UI
    @Published public private(set) var lastConversation: CometChatSDK.Conversation?
    @Published public private(set) var lastEvent: String = ""
    
    // MARK: - Closures for event handling
    public var onConversationDeleted: ((CometChatSDK.Conversation) -> Void)?
    
    // MARK: - Deprecated Closures (for migration)
    public var onConversationDeleteLegacy: ((CometChatSDK.Conversation) -> Void)?
    public var onStartConversationClickLegacy: (() -> Void)?
    
    // MARK: - Singleton-style shared instance
    public static let shared = CometChatConversationEventListener()
    
    private init() {}
    
    // MARK: - Modern Event
    public func ccConversationDeleted(conversation: CometChatSDK.Conversation) {
        lastConversation = conversation
        lastEvent = "Conversation Deleted"
        onConversationDeleted?(conversation)
    }
    
    // MARK: - Deprecated Events
    @available(*, deprecated, message: "Use `ccConversationDeleted(conversation:)` instead")
    public func emitOnConversationDelete(conversation: CometChatSDK.Conversation) {
        lastConversation = conversation
        lastEvent = "Conversation Deleted (Deprecated)"
        onConversationDeleteLegacy?(conversation)
    }
    
    @available(*, deprecated, message: "This method is now deprecated")
    public func emitOnStartConversationClick() {
        lastConversation = nil
        lastEvent = "Start Conversation Clicked (Deprecated)"
        onStartConversationClickLegacy?()
    }
}
