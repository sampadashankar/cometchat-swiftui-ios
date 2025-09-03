//
//  ChatService.swift
//  Sample App
//
//  Created by Sampada Shankar on 26/08/25.
//

import Foundation
import CometChatSDK

@MainActor
final class ChatService: ObservableObject {
    static let shared = ChatService()

    @Published var isInitialized = false
    @Published var currentUser: User?

    private var appId = ""
    private var region = ""
    private var authKey = ""

    private init() {}

    // MARK: - Initialize SDK
    func initialize(appId: String, region: String, authKey: String, completion: @escaping (Bool) -> Void) {
        self.appId = appId
        self.region = region
        self.authKey = authKey

        let settings = AppSettings.AppSettingsBuilder()
            .subscribePresenceForAllUsers()
            .setRegion(region: region)
            .autoEstablishSocketConnection(true)
            .build()

        CometChat.init(appId: appId, appSettings: settings) { [weak self] _ in
            DispatchQueue.main.async {
                self?.isInitialized = true
                completion(true)
            }
        } onError: { error in
            print("❌ CometChat init failed: \(error.errorDescription)")
            completion(false)
        }
    }

    // MARK: - Login
    func login(userId: String, completion: @escaping (Bool) -> Void) {
        guard isInitialized else {
            print("⚠️ SDK not initialized yet")
            completion(false)
            return
        }

        CometChat.login(UID: userId, authKey: authKey) { [weak self] user in
            DispatchQueue.main.async {
                self?.currentUser = user
                print("✅ Login successful: \(user.stringValue())")
                completion(true)
            }
        } onError: { error in
            DispatchQueue.main.async {
                self.currentUser = nil
                print("❌ Login failed: \(error.errorDescription)")
                completion(false)
            }
        }
    }
}

