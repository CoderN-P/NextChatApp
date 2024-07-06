//
//  ChatNavbar.swift
//  Next Chat
//
//  Created by Neel P on 7/2/24.
//

import SwiftUI
import SwiftData


struct ChatNavbar: View {
    @Binding var activePage: Bool
    @Binding var popover: Bool
    @Bindable var chat: Chat
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        VStack {
            GeometryReader { geometry in
                VStack{
                    Spacer()
                    ZStack {
                        
                        HStack {
                            Button(action: {
                                withAnimation {
                                    activePage = false
                                }
                            }){
                                Image(systemName: "arrow.left")
                            }
                            Spacer()
                            Button(action: {
                    
                                popover.toggle()
                                
                            }){
                                HStack {
                                    AsyncImage(url: URL(string: chat.avatar)){ image in
                                        image.resizable()
                                    } placeholder: {
                                        colorScheme == .dark ? Theme.Color.gray900 : Theme.Color.gray200
                                    }
                                    .frame(width: 20, height: 20)
                                    
                                    .clipShape(Circle())
                                    
                                    
                                    Text(chat.name)
                                        .font(.caption)
                                        .bold()
                                }
                                .padding(.all, 10)
                                .background(colorScheme == .dark ? Theme.Color.neutral900 : Theme.Color.neutral50)
                                .clipShape(RoundedRectangle(cornerRadius: 50))
                            }
                            
                            
                        }
                    }
                }
                .padding()
                .frame(height: 100)
                .edgesIgnoringSafeArea(.top)
                .position(x: geometry.size.width / 2, y: 50)
            }
            .background(.ultraThinMaterial)
            .border(width: 1, edges: [.bottom], color: colorScheme == .dark ? Theme.Color.neutral800 : Theme.Color.neutral200)
            .frame(height: 100)
            
            Spacer()
        }
        .foregroundColor(colorScheme == .dark ? .white : .black)
        
        
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: AppData.self, configurations: config)
    
    @State var activePage = false
    @State var popover = false
    
    return ChatNavbar(activePage: $activePage, popover: $popover, chat: defaultChat)
}
