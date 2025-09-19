//
//  CometChatCornerStyle.swift
//  CometChatSwiftUIKit
//
//  Created by Sampada Shankar on 19/09/25.
//

import Foundation
import SwiftUI

// MARK: - Corner Enum
public enum Corner: Int, CaseIterable {
    case leftTop, rightTop, leftBottom, rightBottom, none
}

// MARK: - Corner Style (Boolean flags + radius)
public struct CometChatCornerStyle: Equatable, Hashable, Sendable {
    public private(set) var topLeft: Bool
    public private(set) var topRight: Bool
    public private(set) var bottomLeft: Bool
    public private(set) var bottomRight: Bool
    public private(set) var cornerRadius: CGFloat
    
    public init() {
        self.topLeft = false
        self.topRight = false
        self.bottomLeft = false
        self.bottomRight = false
        self.cornerRadius = 0
    }
    
    public init(
        topLeft: Bool = false,
        topRight: Bool = false,
        bottomLeft: Bool = false,
        bottomRight: Bool = false,
        cornerRadius: CGFloat
    ) {
        self.topLeft = topLeft
        self.topRight = topRight
        self.bottomLeft = bottomLeft
        self.bottomRight = bottomRight
        self.cornerRadius = cornerRadius
    }
    
    /// Converts to SwiftUI `UIRectCorner` for masking
    public var rectCorners: UIRectCorner {
        var corners: UIRectCorner = []
        if topLeft { corners.insert(.topLeft) }
        if topRight { corners.insert(.topRight) }
        if bottomLeft { corners.insert(.bottomLeft) }
        if bottomRight { corners.insert(.bottomRight) }
        return corners.isEmpty ? [] : corners
    }
}

// MARK: - Corner Values (individual radii)
public struct CometChatCorner: Equatable, Hashable, Sendable {
    public var topLeft: CGFloat
    public var topRight: CGFloat
    public var bottomLeft: CGFloat
    public var bottomRight: CGFloat
    public var cornerRadius: CGFloat
    
    public init() {
        self.topLeft = 0
        self.topRight = 0
        self.bottomLeft = 0
        self.bottomRight = 0
        self.cornerRadius = 0
    }
    
    public init(topLeft: CGFloat, topRight: CGFloat, bottomLeft: CGFloat, bottomRight: CGFloat) {
        self.topLeft = topLeft
        self.topRight = topRight
        self.bottomLeft = bottomLeft
        self.bottomRight = bottomRight
        self.cornerRadius = max(topLeft, topRight, bottomLeft, bottomRight)
    }
    
    public init(cornerRadius: CGFloat) {
        self.topLeft = cornerRadius
        self.topRight = cornerRadius
        self.bottomLeft = cornerRadius
        self.bottomRight = cornerRadius
        self.cornerRadius = cornerRadius
    }
}

// MARK: - SwiftUI Shape Helper
public struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    public func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}

public extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape(RoundedCorner(radius: radius, corners: corners))
    }
}
