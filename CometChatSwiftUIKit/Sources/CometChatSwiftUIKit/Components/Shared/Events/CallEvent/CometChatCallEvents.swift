//
//  CometChatCallEvents.swift
//  CometChatSwiftUIKit
//
//  Created by Sampada Shankar on 11/09/25.
//

import Foundation
import SwiftUI
import CometChatSDK

@MainActor
public final class CometChatCallEvents: ObservableObject {
    
    // MARK: - Published properties for UI state
    @Published public private(set) var currentCall: Call?
    @Published public private(set) var lastEvent: String = ""
    
    // MARK: - Closures for event callbacks
    public var onOutgoingCall: ((Call) -> Void)?
    public var onCallAccepted: ((Call) -> Void)?
    public var onCallRejected: ((Call) -> Void)?
    public var onCallEnded: ((Call) -> Void)?
    
    // MARK: - Deprecated Closures (optional, for migration)
    public var onIncomingCallAccepted: ((Call) -> Void)?
    public var onIncomingCallRejected: ((Call) -> Void)?
    public var onCallInitiated: ((Call) -> Void)?
    public var onOutgoingCallAcceptedLegacy: ((Call) -> Void)?
    public var onOutgoingCallRejectedLegacy: ((Call) -> Void)?
    
    // MARK: - Singleton-style shared instance
    public static let shared = CometChatCallEvents()
    
    private init() {}
    
    // MARK: - Modern Events
    public func ccOutgoingCall(call: Call) {
        currentCall = call
        lastEvent = "Outgoing Call"
        onOutgoingCall?(call)
    }
    
    public func ccCallAccepted(call: Call) {
        currentCall = call
        lastEvent = "Call Accepted"
        onCallAccepted?(call)
    }
    
    public func ccCallRejected(call: Call) {
        currentCall = call
        lastEvent = "Call Rejected"
        onCallRejected?(call)
    }
    
    public func ccCallEnded(call: Call) {
        currentCall = call
        lastEvent = "Call Ended"
        onCallEnded?(call)
    }
    
    // MARK: - Deprecated Events
    @available(*, deprecated, message: "Use `ccCallAccepted(call:)` instead")
    public func emitOnIncomingCallAccepted(call: Call) {
        currentCall = call
        lastEvent = "Incoming Call Accepted (Deprecated)"
        onIncomingCallAccepted?(call)
    }
    
    @available(*, deprecated, message: "Use `ccCallRejected(call:)` instead")
    public func emitOnIncomingCallRejected(call: Call) {
        currentCall = call
        lastEvent = "Incoming Call Rejected (Deprecated)"
        onIncomingCallRejected?(call)
    }
    
    @available(*, deprecated, message: "Use `ccCallEnded(call:)` instead")
    public func emitOnCallEnded(call: Call) {
        currentCall = call
        lastEvent = "Call Ended (Deprecated)"
        onCallEnded?(call)
    }
    
    @available(*, deprecated, message: "Use `ccOutgoingCall(call:)` instead")
    public func emitOnCallInitiated(call: Call) {
        currentCall = call
        lastEvent = "Call Initiated (Deprecated)"
        onCallInitiated?(call)
    }
    
    @available(*, deprecated, message: "Use `ccCallAccepted(call:)` instead")
    public func emitOnOutgoingCallAccepted(call: Call) {
        currentCall = call
        lastEvent = "Outgoing Call Accepted (Deprecated)"
        onOutgoingCallAcceptedLegacy?(call)
    }
    
    @available(*, deprecated, message: "Use `ccCallRejected(call:)` instead")
    public func emitOnOutgoingCallRejected(call: Call) {
        currentCall = call
        lastEvent = "Outgoing Call Rejected (Deprecated)"
        onOutgoingCallRejectedLegacy?(call)
    }
}
