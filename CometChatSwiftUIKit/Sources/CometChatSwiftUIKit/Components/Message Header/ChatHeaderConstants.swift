//
//  MessageHeaderConstants.swift
//  cometchat-swiftui-ios
//
//  Created by Sampada Shankar on 10/07/25.
//

import Foundation
import SwiftUI

enum ChatHeaderConstants {
    case member
    case members
    case online
    case offline
    case available
    case typing
    case isTyping

    var displayText: String {
        switch self {
        case .member: return "Member"
        case .members: return "Members"
        case .online: return "Online"
        case .offline: return "Offline"
        case .available: return "Available"
        case .typing: return "Typing"
        case .isTyping: return "is typing..."
        }
    }
}

