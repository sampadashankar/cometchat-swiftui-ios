//
//  CometChatGroupEventListener.swift
//  CometChatSwiftUIKit
//
//  Created by Sampada Shankar on 11/09/25.
//

import Foundation
import SwiftUI
import CometChatSDK


public typealias CCGroup = CometChatSDK.Group

@MainActor
public final class CometChatGroupEventListener: ObservableObject {
    
    
    
    // MARK: - Published state for UI
    @Published public private(set) var lastGroup: CCGroup?
    @Published public private(set) var lastEvent: String = ""
    
    // MARK: - Closures for new API
    public var onGroupCreated: ((CCGroup) -> Void)?
    public var onGroupDeleted: ((CCGroup) -> Void)?
    public var onGroupLeft: ((ActionMessage, User, CCGroup) -> Void)?
    public var onGroupMemberScopeChanged: ((ActionMessage, User, String, String, CCGroup) -> Void)?
    public var onGroupMemberBanned: ((ActionMessage, User, User, CCGroup) -> Void)?
    public var onGroupMemberKicked: ((ActionMessage, User, User, CCGroup) -> Void)?
    public var onGroupMemberUnbanned: ((ActionMessage, User, User, CCGroup) -> Void)?
    public var onGroupMemberJoined: ((User, CCGroup) -> Void)?
    public var onGroupMemberAdded: (([ActionMessage], [User], CCGroup, User) -> Void)?
    public var onOwnershipChanged: ((CCGroup, GroupMember) -> Void)?
    
    // MARK: - Deprecated closures (optional for migration)
    public var onGroupCreateLegacy: ((CCGroup) -> Void)?
    public var onGroupDeleteLegacy: ((CCGroup) -> Void)?
    public var onGroupMemberLeaveLegacy: ((User, CCGroup) -> Void)?
    public var onGroupMemberChangeScopeLegacy: ((User, User, CometChat.MemberScope, CometChat.MemberScope, CCGroup) -> Void)?
    public var onGroupMemberBanLegacy: ((User, CCGroup, User) -> Void)?
    public var onGroupMemberKickLegacy: ((User, CCGroup, User) -> Void)?
    public var onGroupMemberUnbanLegacy: ((User, CCGroup, User) -> Void)?
    public var onGroupMemberJoinLegacy: ((User, CCGroup) -> Void)?
    public var onGroupMemberAddLegacy: ((CCGroup, [GroupMember], User) -> Void)?
    public var onOwnershipChangeLegacy: ((CCGroup?, GroupMember?) -> Void)?
    public var onCreateGroupClickLegacy: (() -> Void)?
    
    // MARK: - Singleton
    public static let shared = CometChatGroupEventListener()
    
    private init() {}
    
    // MARK: - Modern API Triggers
    public func ccGroupCreated(group: CCGroup) {
        lastGroup = group
        lastEvent = "Group Created"
        onGroupCreated?(group)
    }
    
    public func ccGroupDeleted(group: CCGroup) {
        lastGroup = group
        lastEvent = "Group Deleted"
        onGroupDeleted?(group)
    }
    
    public func ccGroupLeft(action: ActionMessage, leftUser: User, leftGroup: CCGroup) {
        lastGroup = leftGroup
        lastEvent = "Group Left"
        onGroupLeft?(action, leftUser, leftGroup)
    }
    
    public func ccGroupMemberScopeChanged(action: ActionMessage, updatedUser: User, scopeChangedTo: String, scopeChangedFrom: String, group: CCGroup) {
        lastGroup = group
        lastEvent = "Member Scope Changed"
        onGroupMemberScopeChanged?(action, updatedUser, scopeChangedTo, scopeChangedFrom, group)
    }
    
    public func ccGroupMemberBanned(action: ActionMessage, bannedUser: User, bannedBy: User, bannedFrom: CCGroup) {
        lastGroup = bannedFrom
        lastEvent = "Member Banned"
        onGroupMemberBanned?(action, bannedUser, bannedBy, bannedFrom)
    }
    
    public func ccGroupMemberKicked(action: ActionMessage, kickedUser: User, kickedBy: User, kickedFrom: CCGroup) {
        lastGroup = kickedFrom
        lastEvent = "Member Kicked"
        onGroupMemberKicked?(action, kickedUser, kickedBy, kickedFrom)
    }
    
    public func ccGroupMemberUnbanned(action: ActionMessage, unbannedUser: User, unbannedBy: User, unbannedFrom: CCGroup) {
        lastGroup = unbannedFrom
        lastEvent = "Member Unbanned"
        onGroupMemberUnbanned?(action, unbannedUser, unbannedBy, unbannedFrom)
    }
    
    public func ccGroupMemberJoined(joinedUser: User, joinedGroup: CCGroup) {
        lastGroup = joinedGroup
        lastEvent = "Member Joined"
        onGroupMemberJoined?(joinedUser, joinedGroup)
    }
    
    public func ccGroupMemberAdded(messages: [ActionMessage], usersAdded: [User], groupAddedIn: CCGroup, addedBy: User) {
        lastGroup = groupAddedIn
        lastEvent = "Member Added"
        onGroupMemberAdded?(messages, usersAdded, groupAddedIn, addedBy)
    }
    
    public func ccOwnershipChanged(group: CCGroup, newOwner: GroupMember) {
        lastGroup = group
        lastEvent = "Ownership Changed"
        onOwnershipChanged?(group, newOwner)
    }
    
    // MARK: - Deprecated API Triggers
    @available(*, deprecated, message: "Use ccGroupCreated(group:) instead")
    public func emitOnGroupCreate(group: CCGroup) {
        lastGroup = group
        lastEvent = "Group Created (Deprecated)"
        onGroupCreateLegacy?(group)
    }
    
    @available(*, deprecated, message: "Use ccGroupDeleted(group:) instead")
    public func emitOnGroupDelete(group: CCGroup) {
        lastGroup = group
        lastEvent = "Group Deleted (Deprecated)"
        onGroupDeleteLegacy?(group)
    }
    
    @available(*, deprecated, message: "Use ccGroupLeft(action:leftUser:leftGroup:) instead")
    public func emitOnGroupMemberLeave(leftUser: User, leftGroup: CCGroup) {
        lastGroup = leftGroup
        lastEvent = "Group Left (Deprecated)"
        onGroupMemberLeaveLegacy?(leftUser, leftGroup)
    }
    
    @available(*, deprecated, message: "Use ccGroupMemberScopeChanged(...) instead")
    public func emitOnGroupMemberChangeScope(updatedBy: User, updatedUser: User, scopeChangedTo: CometChat.MemberScope, scopeChangedFrom: CometChat.MemberScope, group: CCGroup) {
        lastGroup = group
        lastEvent = "Scope Changed (Deprecated)"
        onGroupMemberChangeScopeLegacy?(updatedBy, updatedUser, scopeChangedTo, scopeChangedFrom, group)
    }
    
    @available(*, deprecated, message: "Use ccGroupMemberBanned(...) instead")
    public func emitOnGroupMemberBan(bannedUser: User, bannedGroup: CCGroup, bannedBy: User) {
        lastGroup = bannedGroup
        lastEvent = "Member Banned (Deprecated)"
        onGroupMemberBanLegacy?(bannedUser, bannedGroup, bannedBy)
    }
    
    @available(*, deprecated, message: "Use ccGroupMemberKicked(...) instead")
    public func emitOnGroupMemberKick(kickedUser: User, kickedGroup: CCGroup, kickedBy: User) {
        lastGroup = kickedGroup
        lastEvent = "Member Kicked (Deprecated)"
        onGroupMemberKickLegacy?(kickedUser, kickedGroup, kickedBy)
    }
    
    @available(*, deprecated, message: "Use ccGroupMemberUnbanned(...) instead")
    public func emitOnGroupMemberUnban(unbannedUser: User, unbannedUserGroup: CCGroup, unbannedBy: User) {
        lastGroup = unbannedUserGroup
        lastEvent = "Member Unbanned (Deprecated)"
        onGroupMemberUnbanLegacy?(unbannedUser, unbannedUserGroup, unbannedBy)
    }
    
    @available(*, deprecated, message: "Use ccGroupMemberJoined(...) instead")
    public func emitOnGroupMemberJoin(joinedUser: User, joinedGroup: CCGroup) {
        lastGroup = joinedGroup
        lastEvent = "Member Joined (Deprecated)"
        onGroupMemberJoinLegacy?(joinedUser, joinedGroup)
    }
    
    @available(*, deprecated, message: "Use ccGroupMemberAdded(...) instead")
    public func emitOnGroupMemberAdd(group: CCGroup, members: [GroupMember], addedBy: User) {
        lastGroup = group
        lastEvent = "Members Added (Deprecated)"
        onGroupMemberAddLegacy?(group, members, addedBy)
    }
    
    @available(*, deprecated, message: "Use ccOwnershipChanged(...) instead")
    public func emitOnOwnershipChange(group: CCGroup?, member: GroupMember?) {
        lastGroup = group
        lastEvent = "Ownership Changed (Deprecated)"
        onOwnershipChangeLegacy?(group, member)
    }
    
    @available(*, deprecated, message: "This function is now deprecated")
    public func emitOnCreateGroupClick() {
        lastGroup = nil
        lastEvent = "Create Group Clicked (Deprecated)"
        onCreateGroupClickLegacy?()
    }
}
