//
//  MessageListView.swift
//  cometchat-swiftui-ios
//
//  Created by Sampada Shankar on 11/07/25.
//

import Foundation
import SwiftUI


struct MessageListView: View {
    var isGroupChat: Bool

    var body: some View {
        ScrollView {
            VStack(spacing: 12) {
                // Dummy loop simulating a list of 15 messages
                ForEach(0..<15, id: \.self) { index in
                    HStack {
                        if index % 2 == 0 {
                            Spacer()
                            VStack(alignment: .trailing, spacing: 2) {
                                // Outgoing message
                                Text("Outgoing message \(index)")
                                    .padding(.trailing, 40)
                                    .padding()
                                    .foregroundStyle(.white)
                                    .background(
                                        ZStack(alignment: .bottomTrailing) {
                                            Color(red: 104 / 255, green: 82 / 255, blue: 214 / 255)
                                            Text("10:45 AM")
                                                .font(.caption2)
                                                .foregroundStyle(.white.opacity(0.8))
                                                .padding(.bottom, 4)
                                                .padding(.trailing, 8)
                                        }
                                    )
                                    .cornerRadius(10)
                            }
                        } else {
                            VStack(alignment: .leading, spacing: 2) {
                                if isGroupChat {
                                    // Show sender name only in group chats
                                    Text("User \(index)")
                                        .font(CometChatTypography.font(for: .heading4, weight: .medium))
                                        .foregroundStyle(Color(red: 104 / 255, green: 82 / 255, blue: 214 / 255))
                                        .padding(.leading, 8)
                                }
                                // Incoming message (left aligned)
                                Text("Incoming message \(index)")
                                    .padding(.trailing, 40)
                                    .padding()
                                    .background(
                                        ZStack(alignment: .bottomTrailing) {
                                            Color.gray.opacity(0.2)
                                            Text("10:43 AM")
                                                .font(.caption2)
                                                .foregroundStyle(.gray)
                                                .padding(.bottom, 4)
                                                .padding(.trailing, 8)
                                        }
                                    )
                                    .cornerRadius(10)
                            }
                            Spacer()
                        }
                    }
                    .padding(.horizontal)
                }
            }
            .padding(.top, 10)
        }
    }
}

