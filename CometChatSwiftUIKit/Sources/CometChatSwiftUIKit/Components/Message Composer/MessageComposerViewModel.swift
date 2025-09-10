//
//  MessageComposerViewModel.swift
//  cometchat-swiftui-ios
//
//  Created by Sampada Shankar on 11/07/25.
//

import Foundation
import SwiftUI


class MessageComposerViewModel : ObservableObject{
    @Published var showAlert : Bool = false
    @Published var message : String = ""
    @Published var sendMessage : String = ""
}
