//
//  ChatView.swift
//  Next Chat
//
//  Created by Neel P on 7/2/24.
//

import SwiftUI
import SwiftData


struct ChatView: View {
    @Bindable var chat: Chat
    @Binding var activePage: Bool
    var userCache: [User]
    @State var text: String = ""
    @State var lastMessage: Message? = nil
    @State var popover: Bool = false
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        ZStack {
            if colorScheme == .dark { Theme.Color.neutral950
            } else {
                Theme.Color.neutral50
            }
            
            ChatNavbar(activePage: $activePage, popover: $popover, chat: chat)
                .zIndex(10)
            
            ScrollView(.vertical){
                LazyVStack(alignment: .leading, spacing: 15){
                    Spacer()
                    ForEach(chat.messages){message in
                        MessageView(author: userCache.first(where: {$0._id == message.sender}),
                            message: message,
                            group: calculateGroup(message: message)
                        )
                    }
                    
                }
                .padding(.top, 100)
                .padding(.leading, 10)
                .padding(.trailing, 10)
                .padding(.bottom, 100)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .defaultScrollAnchor(.bottom)
            
            Spacer()
            TextBoxView(text: $text)
                .zIndex(10)
        }
        .popover(isPresented: $popover){
            MemberView()
        }
        .ignoresSafeArea()
    }
    
    private func calculateGroup(message: Message) -> Bool {
        guard lastMessage != nil else {
            lastMessage = message
            return false
        }
        
        if lastMessage?.sender != message.sender {
            lastMessage = message
            return false
        }
        
        if checkGroup(lastMessage?.sendDate ?? Date(), message.sendDate){
            return true
        }
        
        lastMessage = message
        return false
    }
}


#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: AppData.self, configurations: config)
    
    @State var activePage = false
    
    return ChatView(chat: defaultChat, activePage: $activePage, userCache: [defaultUser])
        .modelContainer(container)
}
