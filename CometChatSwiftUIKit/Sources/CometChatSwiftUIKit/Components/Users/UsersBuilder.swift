//
//  UsersBuilder.swift
//  CometChatSwiftUIKit
//
//  Created by Sampada Shankar on 18/09/25.
//

import Foundation
import CometChatSDK

public enum UsersBuilderResult {
    case success([User])
    case failure(CometChatException)
}

public final class UsersBuilder {
    // Default request builder
    public static func getDefaultRequestBuilder() -> CometChatSDK.UsersRequest.UsersRequestBuilder {
        return CometChatSDK.UsersRequest.UsersRequestBuilder().set(limit: 30)
    }

    // Search builder derived from an existing builder
    public static func getSearchBuilder(searchText: String, userRequestBuilder: CometChatSDK.UsersRequest.UsersRequestBuilder = getDefaultRequestBuilder()) -> CometChatSDK.UsersRequest.UsersRequestBuilder {
        return userRequestBuilder.set(searchKeyword: searchText)
    }

    public static func getfilteredUsers(filterUserRequest: CometChatSDK.UsersRequest, completion: @escaping (UsersBuilderResult) -> Void) {
        getFilteredUsers(filterUserRequest: filterUserRequest, completion: completion)
    }

    // Fetch users using a prebuilt UsersRequest
    public static func getFilteredUsers(filterUserRequest: CometChatSDK.UsersRequest, completion: @escaping (UsersBuilderResult) -> Void) {
        filterUserRequest.fetchNext { users in
            completion(.success(users))
        } onError: { error in
            guard let error = error else { return }
            completion(.failure(error))
        }
    }

    // Convenience to fetch users from a UsersRequest
    public static func fetchUsers(userRequest: CometChatSDK.UsersRequest, completion: @escaping (UsersBuilderResult) -> Void) {
        userRequest.fetchNext { fetchedUsers in
            completion(.success(fetchedUsers))
        } onError: { error in
            guard let error = error else { return }
            completion(.failure(error))
        }
    }
}
