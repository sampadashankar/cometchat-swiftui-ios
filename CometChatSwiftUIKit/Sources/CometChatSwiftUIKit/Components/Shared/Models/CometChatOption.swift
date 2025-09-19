//
//  CometChatOption.swift
//  CometChatSwiftUIKit
//
//  Created by Sampada Shankar on 19/09/25.
//

import Foundation
import SwiftUI

public struct CometChatOption: Identifiable, Equatable, Hashable, Sendable {
    
    public let id: String
    public var title: String?
    /// Store a hashable identifier instead of `Image`
    private var iconName: String?
    public var icon: Image? {
        iconName.map { Image(systemName: $0) }
    }
    
    public init(
        id: String = UUID().uuidString,
        title: String? = nil,
        iconSystemName: String? = nil
    ) {
        self.id = id
        self.title = title
        self.iconName = iconSystemName
    }
}

