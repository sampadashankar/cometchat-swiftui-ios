//
//  InteractiveConstants.swift
//  CometChatSwiftUIKit
//
//  Created by Sampada Shankar on 19/09/25.
//

import Foundation

public enum InteractiveConstants: Sendable {
    
    public static let interactiveMessageFormField = "formFields"
    public static let interactiveMessageSubmitElement = "submitElement"
    public static let title = "title"
    public static let avatarURL = "avatarUrl"
    public static let goalCompletionText = "goalCompletionText"
    
    public static let elementType = "elementType"
    public static let elementId = "elementId"
    public static let value = "value"
    
    public static let cardActions = "cardActions"
    public static let imageURL = "imageUrl"
    public static let text = "text"
    
    public static let bufferTime = "bufferTime"
    public static let meetingDuration = "meetingDuration"
    public static let availability = "availability"
    public static let dateRangeStart = "dateRangeStart"
    public static let dateRangeEnd = "dateRangeEnd"
    public static let icsFileURL = "icsFileUrl"
    public static let scheduleElement = "scheduleElement"
    public static let timeZoneCode = "timezoneCode"
    public static let duration = "duration"
    public static let meetStartedAt = "meetStartAt"
    
    public enum OptionElement: Sendable {
        public static let label = "label"
        public static let value = "value"
    }
    
    public enum ElementType: Sendable {
        public static let textInput = "textInput"
        public static let radioButton = "radio"
        public static let label = "label"
        public static let dropDown = "dropdown"
        public static let checkBox = "checkbox"
        public static let button = "button"
    }
    
    public enum TextInputUI: Sendable {
        public static let enabled = "enabled"
        public static let optional = "optional"
        public static let label = "label"
        public static let maxLines = "maxLines"
        public static let placeholder = "placeholder"
        public static let placeholderText = "text"
        public static let defaultValue = "defaultValue"
    }
    
    public enum RadioButtonUI: Sendable {
        public static let enabled = "enabled"
        public static let optional = "optional"
        public static let label = "label"
        public static let options = "options"
        public static let optionId = "id"
        public static let optionValue = "value"
        public static let optionSelected = "selected"
        public static let defaultValue = "defaultValue"
    }
    
    public enum LabelUI: Sendable {
        public static let text = "text"
    }
    
    public enum DropDownUI: Sendable {
        public static let enabled = "enabled"
        public static let optional = "optional"
        public static let label = "label"
        public static let defaultOption = "defaultOption"
        public static let options = "options"
        public static let optionLabel = "label"
        public static let optionValue = "value"
        public static let defaultValue = "defaultValue"
    }
    
    public enum CheckBoxUI: Sendable {
        public static let enabled = "enabled"
        public static let optional = "optional"
        public static let label = "label"
        public static let options = "options"
        public static let optionLabel = "label"
        public static let optionValue = "value"
        public static let optionSelected = "selected"
        public static let defaultValue = "defaultValue"
    }
    
    public enum SingleSelectUI: Sendable {
        public static let enabled = "enabled"
        public static let optional = "optional"
        public static let label = "label"
        public static let defaultValue = "DEFAULT_VALUE"
        public static let options = "options"
        public static let optionLabel = "label"
        public static let optionValue = "value"
    }
    
    public enum ButtonUI: Sendable {
        public static let enable = "enable"
        public static let buttonText = "buttonText"
        public static let action = "action"
        public static let actionType = "actionType"
        public static let actionTypeAlias = "type"
        public static let actionURL = "url"
        public static let actionPayload = "payload"
        public static let actionHeaders = "headers"
        public static let actionDataKey = "dataKey"
        public static let method = "method"
        public static let actionAPI = "apiAction"
        public static let disableAfterInteracted = "disableAfterInteracted"
        public static let appId = "appID"
        public static let region = "region"
        public static let trigger = "trigger"
        public static let payload = "payload"
        public static let conversationId = "conversationId"
        public static let sender = "sender"
        public static let receiver = "receiver"
        public static let receiverType = "receiverType"
        public static let messageCategory = "messageCategory"
        public static let messageId = "messageId"
        public static let interactionTimezoneCode = "interactionTimezoneCode"
        public static let interactedBy = "interactedBy"
        public static let interactedElementId = "interactedElementId"
        public static let messageType = "messageType"
        public static let uiMessageInteracted = "ui_message_interacted"
        public static let schedulerData = "schedulerData"
    }
    
    public enum DateTime: Sendable {
        public static let value = "value"
        public static let timeZone = "timezoneCode"
        public static let optional = "optional"
        public static let label = "label"
        public static let defaultValue = "defaultValue"
        public static let dateTimeFormat = "dateTimeFormat"
        public static let mode = "mode"
        public static let from = "from"
        public static let to = "to"
        public static let actionAPI = "apiAction"
        public static let disableAfterInteracted = "disableAfterInteracted"
        public static let appId = "appID"
        public static let region = "region"
        public static let trigger = "trigger"
        public static let payload = "payload"
        public static let conversationId = "conversationId"
        public static let sender = "sender"
        public static let receiver = "receiver"
        public static let receiverType = "receiverType"
        public static let messageCategory = "messageCategory"
        public static let messageId = "messageId"
        public static let interactionTimezoneCode = "interactionTimezoneCode"
        public static let interactedBy = "interactedBy"
        public static let interactedElementId = "interactedElementId"
        public static let messageType = "messageType"
        public static let uiMessageInteracted = "ui_message_interacted"
        public static let schedulerData = "schedulerData"
    }
}
