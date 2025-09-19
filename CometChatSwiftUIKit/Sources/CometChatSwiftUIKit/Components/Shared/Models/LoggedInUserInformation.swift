//
//  LoggedInUserInformation.swift
//  CometChatSwiftUIKit
//
//  Created by Sampada Shankar on 19/09/25.
//

import Foundation
import CometChatSDK
import Combine

@MainActor
public final class LoggedInUserInformation: ObservableObject, Sendable {
    
    // Published properties so SwiftUI can bind to them
    @Published public private(set) var user: User?
    @Published public private(set) var uid: String = ""
    @Published public private(set) var name: String = ""
    
    public static let shared = LoggedInUserInformation()
    
    private init() {
        refresh()
    }
    
    // MARK: - Refresh User Info
    public func refresh() {
        if let loggedInUser = CometChat.getLoggedInUser() {
            self.user = loggedInUser
            self.uid = loggedInUser.uid ?? "No UID"
            self.name = loggedInUser.name ?? "No Name"
        } else {
            self.user = nil
            self.uid = ""
            self.name = ""
        }
    }
    
    // MARK: - Helpers
    public func isLoggedInUser(uid: String?) -> Bool {
        guard let loggedInUID = user?.uid, let uid = uid else { return false }
        return uid == loggedInUID
    }
}
