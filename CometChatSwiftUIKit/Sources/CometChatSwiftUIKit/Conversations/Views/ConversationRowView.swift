//
//  ConversationRowView.swift
//  CometChatSwiftUIKit
//
//  Created by Sampada Shankar on 02/09/25.
//

import Foundation
import SwiftUI

fileprivate let timeFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateFormat = "hh:mm a"
    return formatter
}()

struct ConversationRowView: View {
    let conversation: Conversation
    @Environment(\.cometChatTheme) private var theme
    
    var body: some View {
        NavigationLink(destination: ChatView()) {
            HStack(spacing: 12) {
                
                // MARK: Avatar
                ConversationAvatarView(avatarURL: conversation.avatarURL, size: 48)
                
                // MARK: Name & Last Message
                VStack(alignment: .leading, spacing: 4) {
                    Text(conversation.name)
                        .font(CometChatTypography.font(for: .heading3, weight: .bold))
                        .lineLimit(1)
                    
                    if let lastMessage = conversation.lastMessage, !lastMessage.isEmpty {
                        Text(lastMessage)
                            .font(CometChatTypography.font(for: .body, weight: .regular))
                            .foregroundColor(.gray)
                            .lineLimit(1)
                    } else {
                        Text("No messages yet")
                            .font(CometChatTypography.font(for: .body, weight: .regular))
                            .foregroundColor(.gray.opacity(0.5))
                    }
                }
                
                Spacer()
                
                VStack {
                    if let lastActive = conversation.lastActiveTime {
                        Text(timeFormatter.string(from: lastActive))
                            .font(.system(size: 12, weight: .medium))
                            .foregroundColor(.gray)
                    }
                    
                    Spacer()
                    
                    // MARK: Unread Badge
                    if conversation.unreadCount > 0 {
                        Text("\(conversation.unreadCount)")
                            .font(.system(size: 12, weight: .bold))
                            .foregroundColor(.white)
                            .padding(.horizontal, 8)
                            .frame(minWidth: 25, minHeight: 25)
                            .background(theme.primary)
                            .clipShape(Capsule())
                            .shadow(radius: 1)
                    }
                }
            }
            .padding(.vertical, 10)
            .padding(.horizontal)
            .background(Color.clear)
        
        }
        .buttonStyle(PlainButtonStyle()) 
    }
}
