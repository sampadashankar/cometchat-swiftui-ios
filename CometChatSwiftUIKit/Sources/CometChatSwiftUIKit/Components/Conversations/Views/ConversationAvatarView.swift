//
//  ConversationAvatarView.swift
//  CometChatSwiftUIKit
//
//  Created by Sampada Shankar on 02/09/25.
//

import Foundation
import SwiftUI
import CometChatSDK

struct ConversationAvatarView: View {
    let size: CGFloat
    let user : CometChatSDK.User?
    let group : CometChatSDK.Group?
    
    var body: some View {
        Group {
            //TODO: Check if it is a user or group conversation
            if let avatarURL = user?.avatar , let url = URL(string: avatarURL) {
                AsyncImage(url: url) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .frame(width: size, height: size)
                            .background(Color.gray.opacity(0.2))
                            .clipShape(Circle())
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFill()
                            .frame(width: size, height: size)
                            .clipShape(Circle())
                    case .failure:
                        Image(systemName: "person.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: size, height: size)
                            .foregroundColor(.gray)
                            .background(Color.gray.opacity(0.2))
                            .clipShape(Circle())
                    @unknown default:
                        EmptyView()
                    }
                }
            } else {
                Image(systemName: "person.fill")
                    .resizable()
                    .scaledToFit()
                    .frame(width: size, height: size)
                    .foregroundColor(.gray)
                    .background(Color.gray.opacity(0.2))
                    .clipShape(Circle())
            }
        }
    }
}
