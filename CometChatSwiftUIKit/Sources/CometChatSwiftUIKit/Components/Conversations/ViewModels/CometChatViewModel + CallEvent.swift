//
//  CometChatViewModel + CallEvent.swift
//  CometChatSwiftUIKit
//
//  Created by Sampada Shankar on 30/09/25.
//

import Foundation
import CometChatSDK


extension ConversationsViewModel {
    
    func ccCallAccepted(call: Call) {
        handleCallUpdate(call)
    }
    
    func ccOutgoingCall(call: Call) {
        handleCallUpdate(call)
    }
    
    func ccCallRejected(call: Call) {
        handleCallUpdate(call)
    }
    
    func ccCallEnded(call: Call) {
        handleCallUpdate(call)
    }
}


extension ConversationsViewModel {
    
    func onIncomingCallReceived(incomingCall: Call?, error: CometChatException?) {
        if let call = incomingCall {
            handleCallUpdate(call)
        }
    }
    
    func onOutgoingCallAccepted(acceptedCall: Call?, error: CometChatException?) {
        if let call = acceptedCall {
            handleCallUpdate(call)
        }
    }
    
    func onOutgoingCallRejected(rejectedCall: Call?, error: CometChatException?) {
        if let call = rejectedCall {
            handleCallUpdate(call)
        }
    }
    
    func onIncomingCallCancelled(canceledCall: Call?, error: CometChatException?) {
        if let call = canceledCall {
            handleCallUpdate(call)
        }
    }
    
    func onCallEndedMessageReceived(endedCall: Call?, error: CometChatException?) {
        if let call = endedCall {
            handleCallUpdate(call)
        }
    }
}

// MARK: - SwiftUI Helper
extension ConversationsViewModel {
    
    private func handleCallUpdate(_ call: Call) {

        guard checkForConversationUpdate(message: call) else { return }
        

        DispatchQueue.main.async { [weak self] in
            self?.update(lastMessage: call)
        }
    }
}
