//
//  UsersViewModel + UsersEventListener.swift
//  CometChatSwiftUIKit
//
//  Created by Sampada Shankar on 19/09/25.
//

import Foundation
import CometChatSDK

// Provide user presence updates.
extension UsersViewModel: @MainActor CometChatUserDelegate {
    public func onUserOnline(user: User) {
        // Mark the user online and update list.
        user.status = .online
        update(user: user)
    }
    
    public func onUserOffline(user: User) {
        user.status = .offline
        update(user: user)
    }
}

extension UsersViewModel: @MainActor CometChatUserEventListener {
    
    public func ccUserUnblocked(user: CometChatSDK.User) {
        // update user
        user.blockedByMe = false
        update(user: user)
    }
    
    public func ccUserBlocked(user: User) {
        // update user
        user.blockedByMe = true
        update(user: user)
    }
}
