//
//  DateFormatter+Extensions.swift
//  CometChatSwiftUIKit
//
//  Created by Sampada Shankar on 10/09/25.
//

import Foundation

public extension DateFormatter {
    
    /// Shared formatter for chat timestamps (e.g. "08:45 PM")
    static let chatTime: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        return formatter
    }()
    
    /// Shared formatter for chat dates (e.g. "Aug 29, 2025")
    static let chatDate: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }()
    
    /// Shared formatter for last seen timestamps (e.g. "Yesterday at 7:15 PM")
    static let lastSeen: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd, hh:mm a"
        return formatter
    }()
}
