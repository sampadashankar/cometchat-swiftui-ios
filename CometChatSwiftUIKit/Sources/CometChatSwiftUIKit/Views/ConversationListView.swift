//
//  SwiftUIView.swift
//  CometChatSwiftUIKit
//
//  Created by Sampada Shankar on 28/08/25.
//

import SwiftUI
import CometChatSDK

public struct ConversationListView: View {
    
    @StateObject private var viewModel = ConversationsViewModel()
    
    public init() {}
    
    public var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                HStack {
                    Text("Chats")
                        .font(CometChatTypography.font(for: .title, weight: .bold))
                        .padding()
                    Spacer()
                }
                Divider()
                
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVStack(spacing: 0) {
                        ForEach(viewModel.conversations, id: \.self) { conversation in
                            NavigationLink(value: conversation) {
                                ConversationRowView(conversation: conversation)
                            }
                            Divider()
                                .padding(.leading, 70)
                        }
                    }
                }
                .background(Color(.systemBackground))
                .refreshable {
                    viewModel.fetchConversations(isRefresh: true)
                }
                .task {
                    viewModel.fetchConversations()
                }
            }
            .navigationDestination(for: CometChatSDK.Conversation.self) { conversation in
                // TODO: Replace with Chat message screen when implemented
            }
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    ConversationListView()
}
