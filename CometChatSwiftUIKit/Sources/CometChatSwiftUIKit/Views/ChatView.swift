//
//  ChatView.swift
//  cometchat-swiftui-ios
//
//  Created by Sampada Shankar on 11/07/25.
//

import SwiftUI

struct ChatView: View {
    @State var viewModel = ChatHeaderViewModel()
    @State var messageComposerViewModel = MessageComposerViewModel()
    var body: some View {
        NavigationStack {
            VStack {
                // Chat header with back button, avatar, and group/user details
                ChatHeaderView(
                    title: viewModel.title ?? "Chat",
                    isGroupChat: viewModel.isGroupChat,
                    numberOfMembers: viewModel.numberOfMembers,
                    isDirectMessage: viewModel.isDirectMessage,
                    avatarImage: viewModel.avatarImage ?? Image(systemName: "person.fill"),
                    onBack: {
                        // TODO: Implement back action here
                    }
                )
                // Placeholder message list view
                MessageListView(isGroupChat: viewModel.isGroupChat)
                Spacer()
                
                // Message input composer view
                MessageComposerView(message: $messageComposerViewModel.message) { msg in
                    messageComposerViewModel.sendMessage = msg
                    messageComposerViewModel.showAlert = true
                }
                
            }
            .alert("Alert", isPresented: $messageComposerViewModel.showAlert) {
                Button("OK", role: .cancel) { }
            } message: {
                Text(messageComposerViewModel.sendMessage)
            }
            .background(.gray.opacity(0.2))
            .navigationBarTitleDisplayMode(.inline)
            .navigationBarBackButtonHidden(true)
        }
    }
}

#Preview {
    ChatView()
}
