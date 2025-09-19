//
//  CometChatUsers.swift
//  CometChatSwiftUIKit
//
//  Created by Sampada Shankar on 19/09/25.
//

import Foundation
import SwiftUI
import CometChatSDK

public enum TitleAlignment {
    case left
    case center
}

@MainActor
public struct CometChatUsers: View {
    @StateObject var viewModel: UsersViewModel 
    @State private var searchText: String = ""
    @State var searchKeyWord: String = ""
    @State private var selectedUsers: [User] = []
    @State private var isRefreshing: Bool = false
    
    // Customization closures (User? to match extension setters)
    public var subtitle: ((_ user: User?) -> AnyView)?
    public var titleView: ((_ user: User?) -> AnyView)?
    public var trailingView: ((_ user: User?) -> AnyView)?
    public var leadingView: ((_ user: User?) -> AnyView)?
    public var customCell: ((_ user: User?) -> AnyView)?
    public var listItemView: ((_ user: User?) -> AnyView)? // added to satisfy extension API
    public var options: ((_ user: User?) -> [CometChatUserOption])?
    public var addOptions: ((_ user: User?) -> [CometChatUserOption])?
    
    // Events
    public var onItemClick: ((_ user: User, _ index: Int?) -> Void)?
    public var onItemLongClick: ((_ user: User, _ index: Int) -> Void)?
    public var onError: ((_ error: CometChatException) -> Void)?
    public var onEmpty: (() -> Void)?
    public var onLoad: (([[User]]) -> Void)?
    public var onSelection: ((_ users: [User]) -> Void)?
    
    public var selectionMode: SelectionMode = .none
    public var selectionLimit: Int?
    public var hideSectionHeader: Bool = false
    public var hideUserStatus: Bool = false
    
    // MARK: - Initializer
    public init(
        usersRequestBuilder: UsersRequest.UsersRequestBuilder = UsersBuilder.getDefaultRequestBuilder(),
        selectionMode: SelectionMode = .none,
        hideSectionHeader: Bool = false,
        hideUserStatus: Bool = false
    ) {
        _viewModel = StateObject(wrappedValue: UsersViewModel(userRequestBuilder: usersRequestBuilder))
        self.selectionMode = selectionMode
        self.hideSectionHeader = hideSectionHeader
        self.hideUserStatus = hideUserStatus
    }
    
    // MARK: - Body
    public var body: some View {
        VStack {
            if viewModel.isSearching {
                searchResultsList
            } else {
                groupedUsersList
            }
        }
        .searchable(text: $searchText, prompt: "Search users")
        .onChange(of: searchText) { newValue in
            if newValue.isEmpty {
                viewModel.isSearching = false
            } else {
                viewModel.isSearching = true
                viewModel.filterUsers(text: newValue)
            }
        }
        .onChange(of: viewModel.users) { newValue in
            onLoad?(newValue)
        }
        .onChange(of: viewModel.error) { err in
            if let err { onError?(err) }
        }
        .overlay {
            if usersEmpty {
                VStack {
                    Image(systemName: "person.fill")
                        .font(.largeTitle)
                        .foregroundColor(.secondary)
                    Text("No Users Found")
                        .font(.headline)
                        .foregroundColor(.secondary)
                }
                .onAppear { onEmpty?() }
            }
        }
        .task {
            if !searchKeyWord.isEmpty { searchText = searchKeyWord }
            viewModel.fetchUsers()
        }
        .refreshable {
            viewModel.isRefresh = true
            await MainActor.run { isRefreshing = false }
        }
        .onAppear { viewModel.connect() }
        .onDisappear { viewModel.disconnect() }
    }
    
    // MARK: - Lists
    private var groupedUsersList: some View {
        List {
            ForEach(Array(viewModel.users.enumerated()), id: \.offset) { section, users in
                if !hideSectionHeader {
                    Section(header: Text(users.first?.name?.prefix(1).uppercased() ?? "")) {
                        ForEach(Array(users.enumerated()), id: \.element.uid) { index, user in
                            userRow(user, index: index, section: section)
                        }
                    }
                } else {
                    ForEach(Array(users.enumerated()), id: \.element.uid) { index, user in
                        userRow(user, index: index, section: section)
                    }
                }
            }
        }
        .listStyle(.insetGrouped)
    }
    
    private var searchResultsList: some View {
        List(Array(viewModel.filteredUsers.enumerated()), id: \.element.uid) { index, user in
            userRow(user, index: index, section: nil)
        }
        .listStyle(.plain)
    }
    
    // MARK: - Row
    private func userRow(_ user: User, index: Int?, section: Int?) -> some View {
        let baseContent: AnyView = {
            if let listItem = listItemView?(user) { return listItem }
            if let custom = customCell?(user) { return custom }
            return AnyView(
                HStack {
                    if let leading = leadingView?(user) { leading }
                    VStack(alignment: .leading, spacing: 4) {
                        if let title = titleView?(user) { title } else { Text(user.name ?? "").font(.headline) }
                        if let subtitle = subtitle?(user) { subtitle }
                    }
                    Spacer()
                    if let trailing = trailingView?(user) { trailing }
                    else if !hideUserStatus {
                        Circle()
                            .fill(user.status == .online ? Color.green : Color.gray)
                            .frame(width: 10, height: 10)
                    }
                }
            )
        }()
        
        let combinedOptions = mergeOptions(for: user)
        
        return baseContent
            .contentShape(Rectangle())
            .onTapGesture { handleSelection(user); onItemClick?(user, index) }
            .onLongPressGesture { if let idx = index { onItemLongClick?(user, idx) } }
            .contextMenu {
                if !combinedOptions.isEmpty {
                    ForEach(combinedOptions, id: \.id) { option in
                        Button {
                            option.onClick?(user, section ?? 0, option, nil)
                        } label: {
                            Label {
                                Text(option.title ?? "Option")
                            } icon: {
                                (option.icon ?? Image(systemName: "ellipsis"))
                            }
                        }
                    }
                }
            }
    }
    
    private func mergeOptions(for user: User) -> [CometChatUserOption] {
        let base = options?(user) ?? []
        let additional = addOptions?(user) ?? []
        // Use Set if Equatable/Hashable by id to prevent duplicates
        var unique: [String: CometChatUserOption] = [:]
        for opt in base + additional { unique[opt.id] = opt }
        return Array(unique.values)
    }
    
    // MARK: - Helpers
    private var usersEmpty: Bool {
        viewModel.isSearching ? viewModel.filteredUsers.isEmpty : viewModel.users.isEmpty
    }
    
    private func handleSelection(_ user: User) {
        switch selectionMode {
        case .none:
            break
        case .single:
            selectedUsers = [user]
            onSelection?(selectedUsers)
        case .multiple:
            if selectedUsers.contains(where: { $0.uid == user.uid }) {
                selectedUsers.removeAll(where: { $0.uid == user.uid })
            } else if selectionLimit == nil || selectedUsers.count < selectionLimit! {
                selectedUsers.append(user)
            }
            onSelection?(selectedUsers)
        }
    }
}
