//
//  MessageComposerView.swift
//  cometchat-swiftui-ios
//
//  Created by Sampada Shankar on 11/07/25.
//

import Foundation
import SwiftUI


struct MessageComposerView : View {
    // Detect the current system color scheme (light or dark)
    @Environment(\.colorScheme) var colorScheme

    @Binding var message: String
    var onSend: (String) -> Void
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                ZStack(alignment: .leading) {
                    if message.isEmpty {
                        // Custom placeholder when message is empty
                        Text("Type your message here...")
                            .foregroundColor(.gray)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 10)
                    }
                    // Actual text field for input
                    TextField("", text: $message)
                        .padding(.horizontal, 20)
                        .padding(.vertical, 10)
                        .foregroundColor(.primary)
                }
                Spacer()
            }
            Divider()
                .foregroundStyle(.secondary)
            HStack {
                // Plus icon for adding attachments
                Image(systemName: "plus.circle")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .padding(.trailing, 20)
                    .foregroundStyle(.gray.opacity(0.7))
                // Microphone icon for voice input
                Image(systemName: "microphone")
                    .resizable()
                    .frame(width: 15, height: 20)
                    .foregroundStyle(.gray.opacity(0.7))
                Spacer()
                // Send button 
                Image(systemName: "paperplane.circle.fill")
                    .resizable()
                    .frame(width: 30, height: 30)
                    .rotationEffect(.degrees(45))
                    .foregroundStyle(
                        message.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty
                        ? (colorScheme == .dark ? .secondary : Color.gray.opacity(0.2))
                        : Color(red: 104 / 255, green: 82 / 255, blue: 214 / 255)
                    )
                    .onTapGesture {
                        let trimmedMessage = message.trimmingCharacters(in: .whitespacesAndNewlines)
                        guard !trimmedMessage.isEmpty else { return }
                        onSend(trimmedMessage)
                        message = ""
                    }
            }
            .padding(.vertical,10)
            .padding(.horizontal, 15)
            
        }
        .background(Color(.systemBackground))
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .padding(10)
    }
}
