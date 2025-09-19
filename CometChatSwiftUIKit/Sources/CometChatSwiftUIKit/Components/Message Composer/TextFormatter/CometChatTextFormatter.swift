//
//  CometChatTextFormatter.swift
//  CometChatSwiftUIKit
//
//  Created by Sampada Shankar on 19/09/25.
//

import Foundation
import SwiftUI
import CometChatSDK

public enum FormattingType {
    case messageBubble
    case composer
    case conversationList
}

open class CometChatTextFormatter: ObservableObject {
    
    public var trackingCharacter: Character
    @Published public var suggestionItemList: [SuggestionItem] = []
    public var user: User?
    public var group: CCGroup?
    internal var formatterID: String?
    
    public init(trackingCharacter: Character) {
        self.trackingCharacter = trackingCharacter
    }
    
    open func set(user: User) {
        self.user = user
        self.group = nil
    }
    
    open func set(group: CCGroup) {
        self.group = group
        self.user = nil
    }
    
    open func getRegex() -> String {
        ""
    }
    
    open func getTrackingCharacter() -> Character {
        trackingCharacter
    }
    
    open func search(
        string: String,
        suggestedItems: (([SuggestionItem]) -> Void)? = nil
    ) {

    }
    
    open func onScrollToBottom(
        suggestionItemList: [SuggestionItem],
        listItem: (([SuggestionItem]) -> Void)?
    ) {
    }
    
    open func onItemClick(
        suggestedItem: SuggestionItem,
        user: User?,
        group: CCGroup?
    ) {
        
    }
    
    open func handlePreMessageSend(
        baseMessage: BaseMessage,
        suggestionItemList: [SuggestionItem]
    ) {
       
    }
    
    open func prepareMessageString(
        baseMessage: BaseMessage,
        regexString: String,
        alignment: MessageBubbleAlignment = .left,
        formattingType: FormattingType
    ) -> AttributedString {
        AttributedString("")
    }
    
    open func onTextTapped(
        baseMessage: BaseMessage,
        tappedText: String
    ) {
        // Override in subclasses
    }
}
