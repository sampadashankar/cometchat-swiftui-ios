//
//  ChatHeaderView.swift
//  cometchat-swiftui-ios
//
//  Created by Sampada Shankar on 11/07/25.
//

import Foundation
import SwiftUI

struct ChatHeaderView: View {
    var title: String
    var isGroupChat: Bool
    var numberOfMembers: Int?
    var isDirectMessage: Bool
    var avatarImage: Image
    var onBack: () -> Void
    var displayHeader : ChatHeaderConstants?

    var body: some View {
        HStack {
            Button {
                onBack()
            } label: {
                Image(systemName: "chevron.backward")
                    .padding(.leading, 20)
                    .padding(.trailing, 10)
                    .foregroundColor(.primary)
            }
            .buttonStyle(.plain)

            avatarImage
                .resizable()
                .frame(width: 50, height: 50)
                .aspectRatio(contentMode: .fit)
                .clipShape(Circle())
                .overlay(alignment: .bottomTrailing) {
                    Image(systemName: "circle.circle.fill")
                        .foregroundColor(.green)
                }
            
            // Chat title and subtitle (members or DM status)
            VStack(alignment: .leading, spacing: 5) {
                Text(title)
                    .font(CometChatTypography.font(for: .heading3, weight: .bold))
                    .foregroundColor(.primary)
                
                // If group chat, show number of members; otherwise fallback to displayText
                Text(isGroupChat ? "\(numberOfMembers ?? 5) members" : displayHeader?.displayText ?? "")
                    .font(CometChatTypography.font(for: .caption1, weight: .regular))
                    .foregroundColor(.gray)
            }

            Spacer()
            // Action buttons for direct messages
            if isDirectMessage {
                HStack {
                    Image(systemName: "video")
                        .padding(.trailing, 15)
                    Image(systemName: "phone")
                        .padding(.trailing, 15)
                    Image(systemName: "info.circle")
                        .padding(.trailing, 15)
                }
                .foregroundColor(.primary)
            }
        }
        .padding(.top, 10)
        .padding(.bottom, 15)
        .background(Color(.systemBackground)) 
    }

}
