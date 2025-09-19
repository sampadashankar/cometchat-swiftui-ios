//
//  CometChatMessageTemplate.swift
//  CometChatSwiftUIKit
//
//  Created by Sampada Shankar on 19/09/25.
//

import Foundation
import SwiftUI
import CometChatSDK

public struct CometChatMessageTemplate {
    
    public var category: String
    public var type: String
    
    // MARK: - View builders
    public var contentView: ((_ message: BaseMessage?, _ alignment: MessageBubbleAlignment) -> AnyView)?
    public var bubbleView: ((_ message: BaseMessage?, _ alignment: MessageBubbleAlignment) -> AnyView)?
    public var headerView: ((_ message: BaseMessage?, _ alignment: MessageBubbleAlignment) -> AnyView)?
    public var footerView: ((_ message: BaseMessage?, _ alignment: MessageBubbleAlignment) -> AnyView)?
    public var bottomView: ((_ message: BaseMessage?, _ alignment: MessageBubbleAlignment) -> AnyView)?
    public var statusInfoView: ((_ message: BaseMessage?, _ alignment: MessageBubbleAlignment) -> AnyView)?
    
    // MARK: - Options
    public var options: ((_ message: BaseMessage?, _ group: CCGroup?) -> [CometChatMessageOption]?)?
    
    // MARK: - Init
    public init(
        category: String,
        type: String,
        contentView: ((_ message: BaseMessage?, _ alignment: MessageBubbleAlignment) -> AnyView)? = nil,
        bubbleView: ((_ message: BaseMessage?, _ alignment: MessageBubbleAlignment) -> AnyView)? = nil,
        headerView: ((_ message: BaseMessage?, _ alignment: MessageBubbleAlignment) -> AnyView)? = nil,
        footerView: ((_ message: BaseMessage?, _ alignment: MessageBubbleAlignment) -> AnyView)? = nil,
        bottomView: ((_ message: BaseMessage?, _ alignment: MessageBubbleAlignment) -> AnyView)? = nil,
        options: ((_ message: BaseMessage?, _ group: CCGroup?) -> [CometChatMessageOption]?)? = nil,
        statusInfoView: ((_ message: BaseMessage?, _ alignment: MessageBubbleAlignment) -> AnyView)? = nil
    ) {
        self.category = category
        self.type = type
        self.contentView = contentView
        self.bubbleView = bubbleView
        self.headerView = headerView
        self.footerView = footerView
        self.bottomView = bottomView
        self.options = options
        self.statusInfoView = statusInfoView
    }
    
    public func toString() -> String {
        "CometChatMessageTemplate { type: \(type), category: \(category) }"
    }
}
