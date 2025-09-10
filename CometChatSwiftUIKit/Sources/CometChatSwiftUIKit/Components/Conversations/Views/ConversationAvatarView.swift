//
//  ConversationAvatarView.swift
//  CometChatSwiftUIKit
//
//  Created by Sampada Shankar on 02/09/25.
//

import Foundation
import SwiftUI

struct ConversationAvatarView: View {
    let avatarURL: String?
    let size: CGFloat
    
    var body: some View {
        Group {
            if let avatarURL = avatarURL, let url = URL(string: avatarURL) {
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
