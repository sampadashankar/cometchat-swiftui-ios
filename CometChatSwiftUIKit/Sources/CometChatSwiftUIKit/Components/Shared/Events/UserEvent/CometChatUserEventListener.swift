//
//  CometChatUserEventListener.swift
//  CometChatSwiftUIKit
//
//  Created by Sampada Shankar on 15/09/25.
//

import Foundation
import CometChatSDK

public typealias CCUser = CometChatSDK.User

public protocol CometChatUserEventListener: AnyObject {
    // Primary callbacks
    func ccUserBlocked(user: CCUser)
    func ccUserUnblocked(user: CCUser)
    // Deprecated legacy naming (will forward to new callbacks)
    @available(*, deprecated, message: "Use ccUserBlocked(user:) instead")
    func onUserBlock(user: CCUser)
    @available(*, deprecated, message: "Use ccUserUnblocked(user:) instead")
    func onUserUnblock(user: CCUser)
}

// MARK: - Default no-op implementations
public extension CometChatUserEventListener {
    func ccUserBlocked(user: CCUser) {}
    func ccUserUnblocked(user: CCUser) {}
    func onUserBlock(user: CCUser) { ccUserBlocked(user: user) }
    func onUserUnblock(user: CCUser) { ccUserUnblocked(user: user) }
}

