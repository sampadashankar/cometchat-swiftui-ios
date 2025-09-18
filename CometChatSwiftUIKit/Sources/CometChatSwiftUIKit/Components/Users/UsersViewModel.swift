//
//  UsersViewModel.swift
//  CometChatSwiftUIKit
//
//  Created by Sampada Shankar on 18/09/25.
//

import Foundation
import CometChatSDK

@MainActor
final class UsersViewModel: ObservableObject, CometChatUserDelegate {
    
    @Published var users: [[User]] = []
    @Published var searchedUsers: [User] = []
    @Published var filteredUsers: [User] = []
    @Published var selectedUsers: [User] = []
    @Published var isSearching: Bool = false
    @Published var isFetching: Bool = false
    @Published var isFetchedAll: Bool = false
    @Published var error: CometChatException?
    
    var userRequestBuilder: UsersRequest.UsersRequestBuilder
    private var userRequest: UsersRequest?
    private var filterUserRequest: UsersRequest?
    
    // Refresh state
    @Published var isRefresh: Bool = false {
        didSet {
            if isRefresh {
                fetchUsers()
            }
        }
    }
    
    init(userRequestBuilder: UsersRequest.UsersRequestBuilder) {
        self.userRequestBuilder = userRequestBuilder
        self.userRequest = userRequestBuilder.build()
    }
    
    // MARK: - API Calls
    func fetchUsers() {
        if isRefresh {
            isFetchedAll = false
            userRequestBuilder = UsersBuilder.getDefaultRequestBuilder()
            userRequest = userRequestBuilder.build()
        }
        
        guard let userRequest = userRequest, !isFetchedAll else { return }
        
        isFetching = true
        
        UsersBuilder.fetchUsers(userRequest: userRequest) { [weak self] result in
            guard let self else { return }
            
            Task { @MainActor in
                switch result {
                case .success(let fetchedUsers):
                    if fetchedUsers.isEmpty {
                        self.isFetchedAll = true
                    } else {
                        if self.isRefresh {
                            self.users.removeAll()
                            self.isRefresh = false
                        }
                        self.isFetchedAll = fetchedUsers.count < userRequest.limit
                    }
                    self.isFetching = false
                    self.groupUsers(users: fetchedUsers)
                    
                case .failure(let error):
                    self.error = error
                    self.isFetching = false
                }
            }
        }
    }
    
    func filterUsers(text: String) {
        filterUserRequest = userRequestBuilder.set(searchKeyword: text).build()
        guard let filterUserRequest else { return }
        
        UsersBuilder.getfilteredUsers(filterUserRequest: filterUserRequest) { [weak self] result in
            guard let self else { return }
            
            Task { @MainActor in
                switch result {
                case .success(let filteredUser):
                    self.filteredUsers = filteredUser
                case .failure(let error):
                    self.error = error
                }
            }
        }
    }
    
    // MARK: - Helpers
    private func groupUsers(users: [User]) {
        var staticUsers = self.users
        for user in users {
            let lastChar = staticUsers.last?.first?.name?.first
            
            if let lastChar, user.name?.first?.lowercased() == lastChar.lowercased() {
                staticUsers[staticUsers.count - 1].append(user)
            } else {
                staticUsers.append([user])
            }
        }
        
        self.users = staticUsers
    }
    
    func getIndexPath(for user: User) -> IndexPath? {
        for (section, group) in users.enumerated() {
            for (row, currentUser) in group.enumerated() {
                if currentUser.uid == user.uid {
                    return IndexPath(row: row, section: section)
                }
            }
        }
        return nil
    }
    
    // MARK: - User Management
    func add(user: User) {
        if !users.flatMap({ $0 }).contains(where: { $0.uid == user.uid }) {
            if users.isEmpty {
                users = [[user]]
            } else {
                users[0].insert(user, at: 0)
            }
        }
    }
    
    func update(user: User) {
        if let indexPath = getIndexPath(for: user) {
            users[indexPath.section][indexPath.row] = user
        }
    }
    
    func remove(user: User) {
        if let indexPath = getIndexPath(for: user) {
            users[indexPath.section].remove(at: indexPath.row)
        }
    }
    
    func clearList() {
        users.removeAll()
    }
    
    func size() -> Int {
        users.count
    }
    
    // MARK: - Listeners
    func connect() {
        // Adding user listener using CometChat SDK
        CometChat.addUserListener(UsersListenerConstants.userListener, self)
    }
    
    func disconnect() {
        // Removing user listener using CometChat SDK
        CometChat.removeUserListener(UsersListenerConstants.userListener)
    }
}
