//
//  CometChatUserEventListener.swift
//  CometChatSwiftUIKit
//
//  Created by Sampada Shankar on 15/09/25.
//

import Foundation
import CometChatSDK

public typealias CCUser = CometChatSDK.User

@MainActor
public final class CometChatUserEventListener: ObservableObject {
    
    // MARK: - Published state for UI binding
    @Published public private(set) var blockedUser: CCUser?
    @Published public private(set) var unblockedUser: CCUser?
    
    // MARK: - Closures for callbacks
    public var onUserBlocked: ((CCUser) -> Void)?
    public var onUserUnblocked: ((CCUser) -> Void)?
    
    // MARK: - Initializer
    public init() {}
    
    // MARK: - Public Event Triggers
    public func ccUserBlocked(user: CCUser) {
        self.blockedUser = user
        onUserBlocked?(user)
    }
    
    public func ccUserUnblocked(user: CCUser) {
        self.unblockedUser = user
        onUserUnblocked?(user)
    }
    
    // MARK: - Deprecated methods (wrapped for compatibility)
    @available(*, deprecated, message: "Use ccUserBlocked(user:) instead")
    public func onUserBlock(user: CCUser) {
        ccUserBlocked(user: user)
    }
    
    @available(*, deprecated, message: "Use ccUserUnblocked(user:) instead")
    public func onUserUnblock(user: CCUser) {
        ccUserUnblocked(user: user)
    }
}
