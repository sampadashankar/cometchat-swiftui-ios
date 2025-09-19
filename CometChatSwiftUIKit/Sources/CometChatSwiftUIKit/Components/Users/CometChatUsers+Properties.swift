//
//  CometChatUsers+Properties.swift
//  CometChatSwiftUIKit
//
//  Created by Sampada Shankar on 19/09/25.
//

import Foundation
import SwiftUI
import CometChatSDK

extension CometChatUsers {
    
    public mutating func set(userRequestBuilder: UsersRequest.UsersRequestBuilder) -> Self {
        viewModel.userRequestBuilder = userRequestBuilder
        return self
    }
    
    public mutating func set(searchRequestBuilder: UsersRequest.UsersRequestBuilder) -> Self {
        viewModel.userRequestBuilder = searchRequestBuilder
        return self
    }
    
    public mutating func set(searchKeyword: String) -> Self {
        self.searchKeyWord = searchKeyword
        return self
    }
    
    @discardableResult
    public mutating func set(onSelection: @escaping ((_ user: [User]) -> Void)) -> Self {
        self.onSelection = onSelection
        return self
    }
    
    // MARK: - SwiftUI View Injectors
    
    @discardableResult
    public mutating func set<Subtitle: View>(subtitle: @escaping (_ user: User?) -> Subtitle) -> Self {
        self.subtitle = { user in AnyView(subtitle(user)) }
        return self
    }
    
    @discardableResult
    public mutating func set<ListItem: View>(listItemView: @escaping (_ user: User?) -> ListItem) -> Self {
        self.listItemView = { user in AnyView(listItemView(user)) }
        return self
    }
    
    @discardableResult
    public mutating func set<Title: View>(titleView: @escaping (_ user: User?) -> Title) -> Self {
        self.titleView = { user in AnyView(titleView(user)) }
        return self
    }
    
    @discardableResult
    public mutating func set<Leading: View>(leadingView: @escaping (_ user: User?) -> Leading) -> Self {
        self.leadingView = { user in AnyView(leadingView(user)) }
        return self
    }
    
    @discardableResult
    public mutating func set<Trailing: View>(trailingView: @escaping (_ user: User?) -> Trailing) -> Self {
        self.trailingView = { user in AnyView(trailingView(user)) }
        return self
    }
    
    // MARK: - Options
    @discardableResult
    public mutating func set(options: ((_ user: User?) -> [CometChatUserOption])?) -> Self {
        self.options = options
        return self
    }
    
    @discardableResult
    public mutating func add(options: ((_ user: User?) -> [CometChatUserOption])?) -> Self {
        self.addOptions = options
        return self
    }
    
    // MARK: - Events
    @discardableResult
    public mutating func set(onItemClick: @escaping ((_ user: User, _ index: Int?) -> Void)) -> Self {
        self.onItemClick = onItemClick
        return self
    }
    
    @discardableResult
    public mutating func set(onItemLongClick: @escaping ((_ user: User, _ index: Int) -> Void)) -> Self {
        self.onItemLongClick = onItemLongClick
        return self
    }
    
    @discardableResult
    public mutating func set(onError: @escaping ((_ error: CometChatException) -> Void)) -> Self {
        self.onError = onError
        return self
    }
    
    @discardableResult
    public mutating func set(onLoad: @escaping (([[User]]) -> Void)) -> Self {
        self.onLoad = onLoad
        return self
    }
    
    @discardableResult
    public mutating func set(onEmpty: @escaping (() -> Void)) -> Self {
        self.onEmpty = onEmpty
        return self
    }
    
    @discardableResult
    public mutating func set(selectionLimit: Int) -> Self {
        self.selectionLimit = selectionLimit
        return self
    }
}
