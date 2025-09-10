//
//  Sample_App.swift
//  Sample App
//
//  Created by Sampada Shankar on 21/08/25.
//

import SwiftUI

@main
struct Sample_App: App {
    @StateObject private var chatService = ChatService.shared
    @State private var isReady = false

    var body: some Scene {
        WindowGroup {
            if isReady {
                ContentView()
                    .environmentObject(chatService)
            } else {
                VStack {
                    ProgressView("Initializing SDK…")
                    Text("Please wait…")
                }
                .onAppear {
                    chatService.initialize(
                        appId: "YOUR_APP_ID",
                        region: "YOUR_REGION",
                        authKey: "YOUR_AUTH_KEY"
                    ) { success in
                        isReady = success
                    }
                }
            }
        }
    }
}

