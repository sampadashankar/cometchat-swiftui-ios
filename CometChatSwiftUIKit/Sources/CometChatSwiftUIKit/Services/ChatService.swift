//
//  ChatService.swift
//  CometChatSwiftUIKit
//
//  Created by Sampada Shankar on 21/08/25.
//

import Foundation
import CometChatSDK

@MainActor
public final class ChatService: ObservableObject {
    public static let shared = ChatService()

    @Published public private(set) var isInitialized = false
    @Published public private(set) var lastError: String?

    private var appId: String = ""
    private var region: String = ""
    private var authKey: String = "" 

    private init() {
        
    }

    public func initialize(appId: String, region: String, authKey: String? = nil, completion: @escaping (Bool) -> Void) {
        self.appId = appId
        self.region = region
        self.authKey = authKey ?? ""

        guard !appId.isEmpty, !region.isEmpty else {
            print("❌ Missing appId/region")
            self.isInitialized = false
            completion(false)
            return
        }

        let settings = AppSettings.AppSettingsBuilder()
            .subscribePresenceForAllUsers()
            .setRegion(region: region)
            .autoEstablishSocketConnection(true)
            .build()

        print("🚀 Calling CometChat.init(appId:\(appId), region:\(region))")
        CometChat.init(appId: appId, appSettings: settings) { [weak self] _ in
            guard let self else { return }
            self.isInitialized = true
            self.lastError = nil
            print("✅ CometChat initialized successfully")
            completion(true)
        } onError: { [weak self] error in
            guard let self else { return }
            self.isInitialized = false
            self.lastError = error.errorDescription
            print("❌ CometChat init failed: \(error.errorDescription)")
            completion(false)
        }
    }
    
    public func login(userId: String, completion: @escaping (Bool) -> Void) {
        guard isInitialized else {
            print("⚠️ Cannot login: SDK not initialized")
            completion(false)
            return
        }
        
        print("🔐 Attempting login for: \(userId)")

        CometChat.login(UID: userId, authKey: authKey) { user in
            DispatchQueue.main.async {
                print("✅ Login successful: \(user.stringValue())")
                completion(true)
            }
        } onError: {  error in
            DispatchQueue.main.async {
                print("❌ Login failed: \(error.errorDescription)")
                completion(false)
            }
        }
    }


}
