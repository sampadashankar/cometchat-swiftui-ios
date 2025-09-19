//
//  CometChatException+Error.swift
//  CometChatSwiftUIKit
//
//  Created to bridge CometChatException into Swift's Error system.
//

import Foundation
import CometChatSDK

// Allow using CometChatException directly as the failure type in Result and throws.
extension CometChatException: Error {}
