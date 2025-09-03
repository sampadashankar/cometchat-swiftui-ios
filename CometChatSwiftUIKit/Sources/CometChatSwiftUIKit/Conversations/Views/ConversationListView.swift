//
//  SwiftUIView.swift
//  CometChatSwiftUIKit
//
//  Created by Sampada Shankar on 28/08/25.
//

import SwiftUI
import SwiftUI

public struct ConversationListView: View {
    
    @StateObject private var viewModel = ConversationListViewModel()
    
    public init() {}
    
    public var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                HStack {
                    Text("Chats")
                        .font(CometChatTypography.font(for: .title, weight: .bold))
                        .padding()
                    Spacer()
                }
                Divider()
                
                ScrollView(.vertical, showsIndicators: false) {
                    LazyVStack(spacing: 0) {
                        ForEach(viewModel.conversations) { conversation in
                            ConversationRowView(conversation: conversation)
                            Divider()
                                .padding(.leading, 70) // offset to avoid crossing avatar
                        }
                    }
                }
                .background(Color(.systemBackground))
            }
            .navigationBarHidden(true)
        }
    }
}


#Preview {
    ConversationListView()
}
