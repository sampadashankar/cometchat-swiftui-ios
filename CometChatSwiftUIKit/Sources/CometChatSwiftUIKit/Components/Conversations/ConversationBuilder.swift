//  ConversationBuilder.swift
//  CometChatSwiftUIKit
//
//  Created to replace missing / buggy prior implementation that triggered
//  concurrency warnings and type mismatch errors.
//

import Foundation
#if canImport(CometChatSDK)
import CometChatSDK
#endif

// MARK: - Result Type (Sendable)
public enum ConversationBuilderResult: Sendable {
    case success([Conversation])
    case failure(Error)
}

// Provide Sendable conformance for the SDK exception type (not declared Sendable upstream).
#if canImport(CometChatSDK)
extension CometChatException: @unchecked Sendable { }
#endif

// MARK: - ConversationBuilder
public final class ConversationBuilder: @unchecked Sendable {
    public static let shared = ConversationBuilder()
    private init() {}
    
    // Public async API returning a strongly typed result enum (non-throwing)
    public func fetchConversations(limit: Int = 30) async -> ConversationBuilderResult {
        await withCheckedContinuation { continuation in
            // Simulate async fetch; replace with real CometChat conversation request if needed.
            DispatchQueue.global().asyncAfter(deadline: .now() + 0.05) {
                let mock: [Conversation] = [
                    Conversation(name: "Alice", lastMessage: "Hi", lastActiveTime: Date().addingTimeInterval(-500), unreadCount: 1),
                    Conversation(name: "Bob", lastMessage: "Yo", lastActiveTime: Date().addingTimeInterval(-900), unreadCount: 0)
                ]
                continuation.resume(returning: .success(mock))
            }
        }
    }
    
    // Legacy convenience async/throws variant if callers prefer that style.
    public func fetchConversationsThrowing(limit: Int = 30) async throws -> [Conversation] {
        let result = await fetchConversations(limit: limit)
        switch result {
        case .success(let list): return list
        case .failure(let error): throw error
        }
    }
}
