//
//  CometChatShimmer.swift
//  CometChatSwiftUIKit
//
//  Created by Sampada Shankar on 19/09/25.
//

import Foundation
import SwiftUI

public struct CometChatShimmerView<Content: View>: View {
    
    public var colorGradient1: Color = Color.gray.opacity(0.3)
    public var colorGradient2: Color = Color.gray.opacity(0.1)
    
    /// Number of placeholder rows
    public var cellCount: Int = 10
    
    /// Controls start/stop shimmer
    @Binding public var isShimmering: Bool
    
    /// Closure to build custom row content
    public let content: () -> Content
    
    public init(
        isShimmering: Binding<Bool>,
        cellCount: Int = 10,
        colorGradient1: Color = Color.gray.opacity(0.3),
        colorGradient2: Color = Color.gray.opacity(0.1),
        @ViewBuilder content: @escaping () -> Content
    ) {
        self._isShimmering = isShimmering
        self.cellCount = cellCount
        self.colorGradient1 = colorGradient1
        self.colorGradient2 = colorGradient2
        self.content = content
    }
    
    public var body: some View {
        List {
            ForEach(0..<(isShimmering ? cellCount : 0), id: \.self) { _ in
                content()
                    .shimmering(colorGradient1: colorGradient1, colorGradient2: colorGradient2)
            }
        }
        .listStyle(.plain)
    }
}

/// Simple shimmer modifier
struct ShimmerModifier: ViewModifier {
    var colorGradient1: Color
    var colorGradient2: Color
    @State private var phase: CGFloat = -1
    
    func body(content: Content) -> some View {
        content
            .overlay(
                LinearGradient(
                    gradient: Gradient(colors: [colorGradient1, colorGradient2, colorGradient1]),
                    startPoint: .topLeading,
                    endPoint: .bottomTrailing
                )
                .rotationEffect(.degrees(30))
                .mask(content)
                .offset(x: phase * 300)
            )
            .onAppear {
                withAnimation(.linear(duration: 1).repeatForever(autoreverses: false)) {
                    phase = 1
                }
            }
    }
}

extension View {
    func shimmering(colorGradient1: Color = Color.gray.opacity(0.3),
                    colorGradient2: Color = Color.gray.opacity(0.1)) -> some View {
        modifier(ShimmerModifier(colorGradient1: colorGradient1, colorGradient2: colorGradient2))
    }
}
