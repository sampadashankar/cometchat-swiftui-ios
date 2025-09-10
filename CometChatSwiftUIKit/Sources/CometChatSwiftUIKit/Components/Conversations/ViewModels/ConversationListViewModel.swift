//
//  ConversationListViewModel.swift
//  CometChatSwiftUIKit
//
//  Created by Sampada Shankar on 02/09/25.
//

import Foundation

@MainActor
final class ConversationListViewModel: ObservableObject {
    @Published var conversations: [Conversation] = []
    
    init() {
        loadMockData()
    }
    
    func loadMockData() {
        conversations = [
            Conversation(name: "Alice Johnson", lastMessage: "Hey! How are you?", lastActiveTime: Date().addingTimeInterval(-3600), unreadCount: 3),
            Conversation(name: "Hiking Group", lastMessage: "Let's meet tomorrow", lastActiveTime: Date().addingTimeInterval(-7200), unreadCount: 100),
            Conversation(name: "Charlie Brown", lastMessage: "Good night", lastActiveTime: Date().addingTimeInterval(-2000), unreadCount: 0)
        ]
    }
}
