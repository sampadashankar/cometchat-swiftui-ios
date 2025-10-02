//
//  ConversationViewModel + ConversationEventListener.swift
//  CometChatSwiftUIKit
//
//  Created by Sampada Shankar on 29/09/25.
//

import CometChatSDK

extension ConversationsViewModel {
    
    func ccConversationDeleted(conversation: CometChatSDK.Conversation) {
        DispatchQueue.main.async { [weak self] in
            self?.conversations.removeAll { $0.conversationId == conversation.conversationId }
        }
    }
    
}
