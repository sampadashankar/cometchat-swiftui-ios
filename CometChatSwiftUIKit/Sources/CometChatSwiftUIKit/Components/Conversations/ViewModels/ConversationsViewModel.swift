//
//  ConversationsViewModel.swift
//  CometChatSwiftUIKit
//
//  Created by Sampada Shankar on 22/09/25.
//

import Foundation
import CometChatSDK

@MainActor
final class ConversationsViewModel: ObservableObject, @MainActor CometChatUserDelegate {
    
    enum CometChatUserStatus {
        case online, offline, available
    }
    
    // MARK: - Published Properties
    @Published var conversations: [CometChatSDK.Conversation] = []
    @Published var filteredConversations: [Conversation] = []
    @Published var selectedConversations: [Conversation] = []
    @Published var isFetching: Bool = false
    @Published var error: CometChatException?
    @Published var isTyping: Bool = false
    var updateStatus: ((Int, CometChatUserStatus) -> Void)?
    
    // MARK: - Internal state
    internal var conversationRequest: ConversationRequest?
    private var refreshConversationRequest: ConversationRequest?
    private var disableReceipt: Bool = false
    private var isFetchedAll: Bool = false
    private let builder = ConversationsBuilder()
    var conversationRequestBuilder: ConversationRequest.ConversationRequestBuilder
        
        init() {
            self.conversationRequestBuilder = builder.defaultRequestBuilder()
            self.conversationRequest = conversationRequestBuilder.build()
        }
    
    // MARK: - Fetch Conversations
    func fetchConversations(isRefresh: Bool = false) {
        if isRefresh {
            isFetchedAll = false
            refreshConversationRequest = conversationRequestBuilder.build()
            conversationRequest = refreshConversationRequest
        }
        
        guard let request = conversationRequest, !isFetchedAll else { return }
        
        isFetching = true
        Task { [weak self] in
            guard let self else { return }
            let result = await self.builder.fetchConversations(with: request)
            self.isFetching = false
            switch result {
            case .success(let convos):
                if convos.isEmpty {
                    self.isFetchedAll = true
                }
                if isRefresh {
                    self.conversations = convos as! [CometChatSDK.Conversation]
                }
                
                for conversation in self.conversations {
                    self.markAsDelivered(conversation: conversation)
                }
                
            case .failure(let err):
                self.error = err
            }
        }
    }
    
    // MARK: - Helpers
    func markAsDelivered(conversation: CometChatSDK.Conversation) {
        guard !disableReceipt else { return }
        if let message = conversation.lastMessage,
           message.deliveredAt == 0.0,
           message.senderUid != CometChat.getLoggedInUser()?.uid {
            CometChat.markAsDelivered(baseMessage: message)
        }
    }
    
    
    
    func update(conversation: CometChatSDK.Conversation) {
        if let index = conversations.firstIndex(where: { $0.conversationId == conversation.conversationId }) {
            conversations[index] = conversation
        }
    }
    
    func update(lastMessage: BaseMessage, updateCount: Bool = true) {
        if let conversation = CometChat.getConversationFromMessage(lastMessage) {
            if let index = conversations.firstIndex(where: { $0.conversationId == conversation.conversationId }) {
                var updated = conversation
                let existing = conversations[index]
                if !LoggedInUserInformation.shared.isLoggedInUser(uid: lastMessage.sender?.uid) {
                    if updateCount && lastMessage.readAt == 0 {
                        updated.unreadMessageCount = existing.unreadMessageCount + 1
                    } else {
                        updated.unreadMessageCount = existing.unreadMessageCount
                    }
                }
                moveToTop(conversation: updated)
                update(conversation: updated)
            } else {
                if !LoggedInUserInformation.shared.isLoggedInUser(uid: lastMessage.sender?.uid) {
                    conversation.unreadMessageCount = 1
                }
                insert(conversation: conversation)
            }
        }
    }
    
    func insert(conversation: CometChatSDK.Conversation, at index: Int = 0) {
        conversations.insert(conversation, at: index)
    }
    
    func moveToTop(conversation: CometChatSDK.Conversation) {
        guard let index = conversations.firstIndex(where: { $0.conversationId == conversation.conversationId }) else { return }
        conversations.remove(at: index)
        conversations.insert(conversation, at: 0)
    }
    
    func remove(conversation: CometChatSDK.Conversation) {
        if let index = conversations.firstIndex(where: { $0.conversationId == conversation.conversationId }) {
            conversations.remove(at: index)
        }
    }
    
    func clearList() {
        conversations.removeAll()
    }
    
    // TODO: Add call and group listeners
    func connect() {
        let listenerID = "conversations-\(Date().timeIntervalSince1970)"
        CometChat.addUserListener(listenerID, self)
    }
    
    func disconnect() {
        let listenerID = "conversations-\(Date().timeIntervalSince1970)"
        CometChat.removeUserListener(listenerID)
    }
    
    func removerConversation(for entity: AppEntity) {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            
            if let conversationIndex = self.conversations.firstIndex(where: { conversation in
                if let user = conversation.conversationWith as? User, let entityUser = entity as? User {
                    return user.uid == entityUser.uid
                } else if let group = conversation.conversationWith as? Group, let entityGroup = entity as? Group {
                    return group.guid == entityGroup.guid
                }
                return false
            }) {
            } else {
                print("Conversation not found for entity: \(entity)")
            }
        }
    }
    
    func checkForConversationUpdate(message: BaseMessage) -> Bool {
           
           let settings = CometChat.getConversationUpdateSettings()
           if message.parentMessageId == 0 || settings.messageReplies == true {
               if let customMessage = message as? CustomMessage {
                   if customMessage.updateConversation || settings.customMessages || ((customMessage.metaData?["incrementUnreadCount"] as? Bool) == true) {
                       return true
                   } else {
                       return false
                   }
               } else if let call = (message as? Call) {
                   return settings.callActivities
               } else {
                   return true
               }
           } else {
               return false
           }
       }
    
    

}

