//
//  ConversationsBuilder.swift
//  CometChatSwiftUIKit
//
//  Created by Sampada Shankar on 22/09/25.
//

import Foundation
import CometChatSDK

enum ConversationsResult {
    case success([Conversation])
    case failure(CometChatException)
}

@MainActor
class ConversationsBuilder: ObservableObject {
    
    func defaultRequestBuilder(limit: Int = 30) -> ConversationRequest.ConversationRequestBuilder {
        return ConversationRequest.ConversationRequestBuilder(limit: limit)
    }
    
    func fetchConversations(with request: ConversationRequest) async -> ConversationsResult {
            await withCheckedContinuation { continuation in
                request.fetchNext { conversations in
                    continuation.resume(returning: .success(conversations as! [Conversation]))
                } onError: { error in
                    let mapped = error ?? CometChatException(errorCode: "UNKNOWN", errorDescription: "Unknown")
                    continuation.resume(returning: .failure(mapped))
                }
            }
        }
    
    func refreshConversations(with request: ConversationRequest) async -> ConversationsResult {
        return await fetchConversations(with: request)
    }
}
