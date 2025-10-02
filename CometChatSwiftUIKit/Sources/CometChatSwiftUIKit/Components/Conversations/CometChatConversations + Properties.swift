//
//  CometChatConversations + Properties.swift
//  CometChatSwiftUIKit
//
//  Created by Sampada Shankar on 26/09/25.
//


import Foundation
import SwiftUI
import CometChatSDK

@MainActor
class CometChatConversationsViewModel: ObservableObject {
    

    @Published var conversations: [Conversation] = []
    @Published var selectedConversations: [Conversation] = []
    @Published var error: CometChatException?
    

    var onItemClick: ((_ conversation: Conversation, _ index: Int) -> Void)?
    var onItemLongClick: ((_ conversation: Conversation, _ index: Int) -> Void)?
    var onSelection: ((_ conversations: [Conversation]) -> Void)?
    var onLoad: ((_ conversations: [Conversation]) -> Void)?
    var onEmpty: (() -> Void)?
    

    var textFormatters: [CometChatTextFormatter] = []
    var datePattern: ((_ conversation: Conversation) -> String)?
    var options: ((_ conversation: Conversation?) -> [CometChatConversationOption])?
    var addOptions: ((_ conversation: Conversation?) -> [CometChatConversationOption])?
    var customSoundForMessages: URL?
    

    var listItemView: ((_ conversation: Conversation) -> AnyView)?
    var trailingView: ((_ conversation: Conversation) -> AnyView)?
    var subtitleView: ((_ conversation: Conversation) -> AnyView)?
    var leadingView: ((_ conversation: Conversation) -> AnyView)?
    var titleView: ((_ conversation: Conversation) -> AnyView)?
    

    private var conversationRequestBuilder: ConversationRequest.ConversationRequestBuilder?
    private var conversationRequest: ConversationRequest?
    

    private var isFetching = false
    private var isFetchedAll = false
    

    init() {}
    

    @discardableResult
    func setOnItemClick(_ action: @escaping (Conversation, Int) -> Void) -> Self {
        self.onItemClick = action
        return self
    }
    
    @discardableResult
    func setOnItemLongClick(_ action: @escaping (Conversation, Int) -> Void) -> Self {
        self.onItemLongClick = action
        return self
    }
    
    @discardableResult
    func setOnSelection(_ action: @escaping ([Conversation]) -> Void) -> Self {
        self.onSelection = action
        return self
    }
    
    @discardableResult
    func setOnLoad(_ action: @escaping ([Conversation]) -> Void) -> Self {
        self.onLoad = action
        return self
    }
    
    @discardableResult
    func setOnEmpty(_ action: @escaping () -> Void) -> Self {
        self.onEmpty = action
        return self
    }
    

    @discardableResult
    func setTextFormatters(_ formatters: [CometChatTextFormatter]) -> Self {
        self.textFormatters = formatters
        return self
    }
    
    @discardableResult
    func setDatePattern(_ pattern: @escaping (Conversation) -> String) -> Self {
        self.datePattern = pattern
        return self
    }
    
    @discardableResult
    func setOptions(_ options: @escaping (Conversation?) -> [CometChatConversationOption]) -> Self {
        self.options = options
        return self
    }
    
    @discardableResult
    func addOptions(_ options: @escaping (Conversation?) -> [CometChatConversationOption]) -> Self {
        self.addOptions = options
        return self
    }
    
    @discardableResult
    func setCustomSound(_ url: URL) -> Self {
        self.customSoundForMessages = url
        return self
    }
    
    // MARK: - SwiftUI View setters
    @discardableResult
    func setListItemView<Content: View>(_ view: @escaping (Conversation) -> Content) -> Self {
        self.listItemView = { conversation in AnyView(view(conversation)) }
        return self
    }
    
    @discardableResult
    func setTrailingView<Content: View>(_ view: @escaping (Conversation) -> Content) -> Self {
        self.trailingView = { conversation in AnyView(view(conversation)) }
        return self
    }
    
    @discardableResult
    func setSubtitleView<Content: View>(_ view: @escaping (Conversation) -> Content) -> Self {
        self.subtitleView = { conversation in AnyView(view(conversation)) }
        return self
    }
    
    @discardableResult
    func setLeadingView<Content: View>(_ view: @escaping (Conversation) -> Content) -> Self {
        self.leadingView = { conversation in AnyView(view(conversation)) }
        return self
    }
    
    @discardableResult
    func setTitleView<Content: View>(_ view: @escaping (Conversation) -> Content) -> Self {
        self.titleView = { conversation in AnyView(view(conversation)) }
        return self
    }
    

    func setConversationRequestBuilder(_ builder: ConversationRequest.ConversationRequestBuilder) {
        self.conversationRequestBuilder = builder
        self.conversationRequest = builder.build()
    }
    
    func insert(conversation: Conversation, at index: Int = 0) {
        conversations.insert(conversation, at: index)
    }
    
    func update(conversation: Conversation) {
        if let index = conversations.firstIndex(where: { $0.id == conversation.id }) {
            conversations[index] = conversation
        }
    }
    
    func remove(conversation: Conversation) {
        if let index = conversations.firstIndex(where: { $0.id == conversation.id }) {
            conversations.remove(at: index)
        }
    }
    
    func clearList() {
        conversations.removeAll()
    }
    
    func size() -> Int {
        conversations.count
    }
}
