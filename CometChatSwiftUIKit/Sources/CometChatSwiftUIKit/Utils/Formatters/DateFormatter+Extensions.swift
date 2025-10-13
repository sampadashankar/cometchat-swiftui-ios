//
//  DateFormatter+Extensions.swift
//  CometChatSwiftUIKit
//
//  Created by Sampada Shankar on 10/09/25.
//

import Foundation

public extension DateFormatter {
    
    static let chatTime: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "hh:mm a"
        return formatter
    }()
    
    static let chatDate: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        return formatter
    }()
    
    static let lastSeen: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd, hh:mm a"
        return formatter
    }()
}
