//
//  ChatsView.swift
//  Next Chat
//
//  Created by Neel P on 7/2/24.
//

import SwiftUI

struct ChatsView: View {
    @Binding var selectedChat: String?
    var chats: [Chat]
    @State var popover: Bool = false
    @Binding var activePage: Bool
    
    var body: some View {
        ZStack {
            ChatsNavbar(popover: $popover)
                .zIndex(3)
            
            ScrollView {
                VStack{
                    ForEach(chats) { chat in
                        ChatCard(chat: chat, selectedChat: $selectedChat,
                        activePage: $activePage)
                    }
                }
                .padding(.top, 115)
                .padding(.leading, 10)
                .padding(.trailing, 10)
            }
            
        }
        .popover(isPresented: $popover){
            AddChatView()
        }
    }
}

#Preview {
    @State var selectedChat: String? = nil
    @State var activePage: Bool = false
    
    return ChatsView(selectedChat: $selectedChat, chats: [defaultChat], activePage: $activePage)
}
