//
//  SwiftUIConstants.swift
//  CometChatSwiftUIKit
//
//  Created by Sampada Shankar on 15/09/25.
//

import Foundation
import SwiftUI

//TODO: channel, packageName and SwiftUIConstants(version, messageID, conversationID,senderID, TimezoneCode) need to be defined

public struct MessagesConstants {
    public static let parentMessageId = "parentMessageId"
}

// MARK: - Message Types
public enum MessageCategory: String, CaseIterable, Identifiable {
    case message, custom, action, call, interactive
    public var id: String { rawValue }
}

public enum MessageType: String, CaseIterable, Identifiable {
    case text, file, image, audio, video
    case poll = "extension_poll"
    case sticker = "extension_sticker"
    case document = "extension_document"
    case whiteboard = "extension_whiteboard"
    case meeting, location, groupMember, message, form, card, scheduler
    
    public var id: String { rawValue }
    
    
    public var icon: Image {
        switch self {
        case .text: return Image(systemName: "text.bubble")
        case .file: return Image(systemName: "doc.fill")
        case .image: return Image(systemName: "photo")
        case .audio: return Image(systemName: "mic.fill")
        case .video: return Image(systemName: "video.fill")
        case .poll: return Image(systemName: "list.bullet.rectangle")
        case .sticker: return Image(systemName: "face.smiling")
        case .document: return Image(systemName: "doc.text.fill")
        case .whiteboard: return Image(systemName: "square.and.pencil")
        case .meeting: return Image(systemName: "person.3.fill")
        case .location: return Image(systemName: "mappin.and.ellipse")
        case .groupMember: return Image(systemName: "person.2.fill")
        case .form: return Image(systemName: "list.bullet.clipboard")
        case .card: return Image(systemName: "creditcard.fill")
        case .scheduler: return Image(systemName: "calendar")
        default: return Image(systemName: "bubble.left")
        }
    }
}

// MARK: - Composer Attachments
public enum ComposerAttachment: String, CaseIterable, Identifiable {
    case camera, gallery, audio, file
    public var id: String { rawValue }
    
    public var icon: Image {
        switch self {
        case .camera: return Image(systemName: "camera.fill")
        case .gallery: return Image(systemName: "photo.on.rectangle")
        case .audio: return Image(systemName: "mic.fill")
        case .file: return Image(systemName: "doc.fill")
        }
    }
}

// MARK: - Alignments & Status
public enum MessageBubbleAlignment {
    case left, right, center
}

public enum MessageBubbleTimeAlignment {
    case top, bottom
}

public enum MessageStatus: Int {
    case inProgress, success, error
}

public enum MessageListAlignment {
    case standard, leftAligned
}

// MARK: - Group / User Options
public enum GroupOption: String, CaseIterable, Identifiable {
    case leave, delete, viewMembers, addMembers, bannedMembers
    case voiceCall, videoCall, viewInformation
    public var id: String { rawValue }
}

public enum GroupMemberOption: String, CaseIterable, Identifiable {
    case kick, ban, unban, changeScope
    public var id: String { rawValue }
}

public enum UserOption: String, CaseIterable, Identifiable {
    case unblock, block, blockUnblock, viewProfile
    case voiceCall, videoCall, viewInformation
    public var id: String { rawValue }
}

// MARK: - Group & Conversation Types
public enum ConversationType: String {
    case users, groups, both
}

public enum GroupType: String {
    case `private` = "private"
    case passwordProtected = "password"
    case `public` = "public"
}

public enum GroupMemberScope: String {
    case admin, moderator, participant
}

// MARK: - Selection Mode
public enum SelectionMode {
    case single, multiple, none
}


public enum UsersListenerConstants {
    static let userListener = "users-user-listener"
    
}
