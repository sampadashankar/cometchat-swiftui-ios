//
//  ContentView.swift
//  Sample App
//
//  Created by Sampada Shankar on 21/08/25.
//

import SwiftUI
import CometChatSwiftUIKit

struct ContentView: View {
    @EnvironmentObject var chatService: ChatService
    @State private var isLoggingIn = false
    @State private var loginStatus = ""

    var body: some View {
        VStack(spacing: 20) {
            if let user = chatService.currentUser {
                Text("✅ Logged in as \(user.name ?? user.uid ?? "Unknown")")
                    .foregroundColor(.green)

                
            } else {
                if chatService.isInitialized {
                    Text("✅ SDK Initialized")
                        .foregroundColor(.green)
                } else {
                    Text("❌ SDK Not Initialized")
                        .foregroundColor(.red)
                }

                Button("Login") {
                    loginUser()
                }
                .disabled(!chatService.isInitialized || isLoggingIn)
                .padding()
                .background(chatService.isInitialized ? Color.blue : Color.gray)
                .foregroundColor(.white)
                .cornerRadius(8)

                if !loginStatus.isEmpty {
                    Text(loginStatus)
                        .foregroundColor(loginStatus.contains("✅") ? .green : .red)
                }
            }
        }
        .padding()
    }

    private func loginUser() {
        isLoggingIn = true
        loginStatus = "🔄 Logging in…"

        chatService.login(userId: "cometchat-uid-1") { success in
            DispatchQueue.main.async {
                isLoggingIn = false
                loginStatus = success ? "✅ Login Successful" : "❌ Login Failed"
            }
        }
    }
}
