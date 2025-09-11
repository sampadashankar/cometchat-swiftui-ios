//
//  /CometChatCallEventListener.swift
//  CometChatSwiftUIKit
//
//  Created by Sampada Shankar on 11/09/25.
//

import Foundation
import SwiftUI
import CometChatSDK


@MainActor
public final class CometChatCallEventListener: ObservableObject {
    
    // MARK: - Closures for modern events
    public var onOutgoingCall: ((Call) -> Void)?
    public var onCallAccepted: ((Call) -> Void)?
    public var onCallRejected: ((Call) -> Void)?
    public var onCallEnded: ((Call) -> Void)?
    
    // MARK: - Closures for deprecated events (optional, for migration)
    public var onIncomingCallAccepted: ((Call) -> Void)?
    public var onIncomingCallRejected: ((Call) -> Void)?
    public var onCallInitiated: ((Call) -> Void)?
    public var onOutgoingCallAcceptedLegacy: ((Call) -> Void)?
    public var onOutgoingCallRejectedLegacy: ((Call) -> Void)?
    
    // MARK: - Published state for SwiftUI
    @Published public private(set) var currentCall: Call?
    @Published public private(set) var lastEvent: String = ""
    
    public init() {}
    
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
    public func triggerIncomingCallAccepted(call: Call) {
        currentCall = call
        lastEvent = "Incoming Call Accepted (Deprecated)"
        onIncomingCallAccepted?(call)
    }
    
    public func triggerIncomingCallRejected(call: Call) {
        currentCall = call
        lastEvent = "Incoming Call Rejected (Deprecated)"
        onIncomingCallRejected?(call)
    }
    
    public func triggerCallInitiated(call: Call) {
        currentCall = call
        lastEvent = "Call Initiated (Deprecated)"
        onCallInitiated?(call)
    }
    
    public func triggerOutgoingCallAccepted(call: Call) {
        currentCall = call
        lastEvent = "Outgoing Call Accepted (Deprecated)"
        onOutgoingCallAcceptedLegacy?(call)
    }
    
    public func triggerOutgoingCallRejected(call: Call) {
        currentCall = call
        lastEvent = "Outgoing Call Rejected (Deprecated)"
        onOutgoingCallRejectedLegacy?(call)
    }
}

