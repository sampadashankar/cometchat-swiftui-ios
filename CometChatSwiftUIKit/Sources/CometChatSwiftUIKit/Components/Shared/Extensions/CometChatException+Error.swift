//
//  CometChatException+Error.swift
//  CometChatSwiftUIKit
//
//  Created to bridge CometChatException into Swift's Error system.
//

import Foundation
import CometChatSDK


extension CometChatException: Error, @unchecked Sendable {}
