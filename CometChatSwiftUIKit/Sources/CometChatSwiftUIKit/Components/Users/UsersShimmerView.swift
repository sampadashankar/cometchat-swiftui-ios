//
//  UsersShimmerView.swift
//  CometChatSwiftUIKit
//
//  Created by Sampada Shankar on 19/09/25.
//

import Foundation
import SwiftUI


public struct UsersShimmerView: View {
    
    /// Number of shimmer cells to show
    public var cellCount: Int = 20
    

    public var colorGradient1: Color = Color.gray.opacity(0.3)
    public var colorGradient2: Color = Color.gray.opacity(0.1)
    

    @Binding public var isShimmering: Bool
    
    public init(cellCount: Int = 20, isShimmering: Binding<Bool>, colorGradient1: Color = Color.gray.opacity(0.3), colorGradient2: Color = Color.gray.opacity(0.1)) {
        self.cellCount = cellCount
        self._isShimmering = isShimmering
        self.colorGradient1 = colorGradient1
        self.colorGradient2 = colorGradient2
    }
    
    public var body: some View {
        List {
            ForEach(0..<(isShimmering ? cellCount : 0), id: \.self) { _ in
                HStack(spacing: 12) {
                    Circle()
                        .frame(width: 48, height: 48)
                        .shimmering(colorGradient1: colorGradient1, colorGradient2: colorGradient2)
                    
                    RoundedRectangle(cornerRadius: 11)
                        .frame(width: 160, height: 22)
                        .shimmering(colorGradient1: colorGradient1, colorGradient2: colorGradient2)
                    
                    Spacer()
                }
                .padding(.vertical, 8)
            }
        }
        .listStyle(.plain)
    }
}

