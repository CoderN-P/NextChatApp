//
//  MessageView.swift
//  Next Chat
//
//  Created by Neel P on 7/2/24.
//

import SwiftUI
import SwiftData
import CachedAsyncImage

struct MessageView: View {
    var author: User?
    @Environment(\.colorScheme) var colorScheme
    @Bindable var message: Message
    var group: Bool
    var body: some View {

        if !group && author != nil {
            HStack(alignment: .top, spacing: 15){
                CachedAsyncImage(url: URL(string: author?.image ?? "")){ image in
                    image.resizable()
                } placeholder: {
                    colorScheme == .dark ? Theme.Color.gray900 : Theme.Color.gray200
                }
                .frame(maxWidth: 40, maxHeight: 40)
                .clipShape(Circle())
                
                VStack(alignment: .leading) {
                    HStack {
                        Text(author?.name ?? "")
                            .font(.headline)
                        Text(getTimeString(message.sendDate))
                            .font(.caption2)
                    }
                    Text(LocalizedStringKey(message.content))
                        .font(.subheadline)
                    
                }
                Spacer()
            }
            .frame(maxWidth: .infinity)
        } else {
            Text(LocalizedStringKey(message.content))
                .font(.subheadline)
        }
        
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: AppData.self, configurations: config)
    
    return MessageView(author: defaultUser, message: defaultChat.messages[0], group: false)
}
