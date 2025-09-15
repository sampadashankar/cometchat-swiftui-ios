//
//  CometChatUserEvents.swift
//  CometChatSwiftUIKit
//
//  Created by Sampada Shankar on 15/09/25.
//

import Foundation
import CometChatSDK


@MainActor
public final class CometChatUserEvents {
    public static let shared = CometChatUserEvents()
    
    private init() {}
    private var observers = NSHashTable<AnyObject>.weakObjects()
    
    // MARK: - Listener Management
    public func addListener(_ observer: CometChatUserEventListener) {
        observers.add(observer)
    }
    
    public func removeListener(_ observer: CometChatUserEventListener) {
        observers.remove(observer)
    }
    
    // MARK: - Event Emitters
    public func ccUserBlocked(user: CCUser) {
        for case let observer as CometChatUserEventListener in observers.allObjects {
            observer.ccUserBlocked(user: user)
        }
    }
    
    public func ccUserUnblocked(user: CCUser) {
        for case let observer as CometChatUserEventListener in observers.allObjects {
            observer.ccUserUnblocked(user: user)
        }
    }
    
    // MARK: - Deprecated Emitters
    @available(*, deprecated, message: "Use ccUserBlocked(user:) instead")
    internal func emitOnUserBlock(user: CCUser) {
        for case let observer as CometChatUserEventListener in observers.allObjects {
            observer.onUserBlock(user: user)
        }
    }
    
    @available(*, deprecated, message: "Use ccUserUnblocked(user:) instead")
    internal func emitOnUserUnblock(user: CCUser) {
        for case let observer as CometChatUserEventListener in observers.allObjects {
            observer.onUserUnblock(user: user)
        }
    }
}
