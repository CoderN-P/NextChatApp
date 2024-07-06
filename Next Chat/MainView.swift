//
//  ContentView.swift
//  Next Chat
//
//  Created by Neel P on 7/2/24.
//

import SwiftUI
import SwiftData

struct MainView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var appData: [AppData]
    @State var selectedChat: String? = "1"
    @State var activePage: Bool = true
    
    var body: some View {
        if appData.count == 0 {
            LoginView()
                
        } else {
            let chat = appData[0].chats.first(where: {
                $0._id == selectedChat
            }) ?? defaultChat
            
            SlideOverView(
                isRevealed: $activePage,
                
                content:
                    ChatView(chat: chat, activePage: $activePage, userCache: appData[0].cachedUsers)
                        .transition(.move(edge: .leading)),
                background: ChatsView(selectedChat: $selectedChat, chats: appData[0].chats,
                    activePage: $activePage)
            )
                
        }
    }

    
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: AppData.self, configurations: config)
    
    var messages: [Message] = []
    
    for (index) in 0..<20 {
        messages.append (Message(_id: "\(index)", content: "\(index) aadkmmvfkvmkfvmkl lll mmm ok ok ", sender: "2", sendDate: Date().addingTimeInterval(-7000)))
    }
    
    
    let chat = Chat(
        _id: "1",
        name: "Test",
        users: ["2"],
        owner: "2",
        messages: messages,
        createdAt: Date(),
        avatar: "https://images.unsplash.com/photo-1526763025764-2a8073a0cd43?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8bW9udW1lbnQlMjB2YWxsZXl8ZW58MHx8MHx8fDA%3D"
    )
    
    let chat2 = Chat(
        _id: "4",
        name: "Test",
        users: ["2"],
        owner: "2",
        messages: messages,
        createdAt: Date(),
        avatar: "https://images.unsplash.com/photo-1526763025764-2a8073a0cd43?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8bW9udW1lbnQlMjB2YWxsZXl8ZW58MHx8MHx8fDA%3D"
    )
    
    let user = User(
        _id: "2",
        name: "neel",
        email: "neel.parpia@gmail.com",
        image: "https://neelp.tech/static/images/codern_pfp.gif",
        createdAt: Date(),
        friends: [],
        chats: [],
        status: "",
        customStatus: "",
        lastReadChat: "",
        googleId: "",
        phoneNumber: ""
    )
    
    let appData = AppData(
        user: user, chats: [chat, chat2], cachedUsers: [user]
    )
    
    container.mainContext.insert(appData)
    
    return MainView()
        .modelContainer(container)
}
