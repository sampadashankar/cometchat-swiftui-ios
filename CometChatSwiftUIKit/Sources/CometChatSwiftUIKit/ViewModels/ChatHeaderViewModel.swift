//
//  ChatHeaderViewModel.swift
//  cometchat-swiftui-ios
//
//  Created by Sampada Shankar on 10/07/25.
//

import Foundation
import SwiftUI


class ChatHeaderViewModel: ObservableObject{
       @Published var title: String? = "Hiking Group"
       @Published var avatarImage: Image? = Image(systemName: "person.fill")
        
       @Published var isGroupChat: Bool = true
       @Published var isDirectMessage: Bool = false
    
       @Published var numberOfMembers :Int?

}
