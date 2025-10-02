//
//  ConversationViewModel + UserEventListener.swift
//  CometChatSwiftUIKit
//
//  Created by Sampada Shankar on 22/09/25.
//

import Foundation
import CometChatSDK

// MARK: - CometChatUserEventListener
extension ConversationsViewModel {
    
    func ccUserBlocked(user: CometChatSDK.User) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            if self.conversationRequest?.includeBlockedUsers == false {
                removerConversation(for: user)
            }
        }
    }
}

// MARK: - CometChatUserDelegate
extension ConversationsViewModel {
    
    public func onUserOnline(user: User) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self,
                  let row = self.conversations.firstIndex(where: { ($0.conversationWith as? User)?.uid == user.uid })
            else { return }
            
            self.conversations[row].conversationWith = user
            self.updateStatus?(row, .online)
        }
    }
    
    public func onUserOffline(user: User) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self,
                  let row = self.conversations.firstIndex(where: { ($0.conversationWith as? User)?.uid == user.uid })
            else { return }
            
            self.conversations[row].conversationWith = user
            self.updateStatus?(row, .offline)
        }
    }
}
