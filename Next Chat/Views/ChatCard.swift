//
//  ChatCard.swift
//  Next Chat
//
//  Created by Neel P on 7/3/24.
//

import SwiftUI
import SwiftData

struct ChatCard: View {
    @Bindable var chat: Chat
    @Binding var selectedChat: String?
    @Binding var activePage: Bool
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        Button(action: {
            selectedChat = chat._id
            activePage = true
            
            let impactMed = UIImpactFeedbackGenerator(style: .medium)
                impactMed.impactOccurred()
        }){
            HStack(spacing: 15) {
                AsyncImage(url: URL(string: chat.avatar)){ image in
                    image.resizable()
                } placeholder: {
                    colorScheme == .dark ? Theme.Color.gray900 : Theme.Color.gray200
                }
                .frame(minWidth: 40, maxWidth: 40, minHeight: 40, maxHeight: 40)
                .clipShape(Circle())
                
                VStack {
                    Text(chat.name)
                        .font(.subheadline)
                        .bold()
                        .foregroundStyle(colorScheme == .dark ? .white : .black)
                    
                    
                }
                
                Spacer()
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(selectedChat == chat._id ? colorScheme == .dark ? Theme.Color.neutral950 : Theme.Color.neutral50 : .clear)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .overlay( /// apply a rounded border
                RoundedRectangle(cornerRadius: 20)
                    .stroke(selectedChat == chat._id ? (colorScheme == .dark ? Theme.Color.neutral800 : Theme.Color.neutral200) : .clear, lineWidth: 1)
            )
        }
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: AppData.self, configurations: config)
    
    @State var selectedChat: String? = defaultChat._id
    @State var activePage: Bool = false
    
    return ChatCard(chat: defaultChat, selectedChat: $selectedChat, activePage: $activePage)
}
