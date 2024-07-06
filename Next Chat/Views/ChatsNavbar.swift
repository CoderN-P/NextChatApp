//
//  ChatNavbar.swift
//  Next Chat
//
//  Created by Neel P on 7/2/24.
//

import SwiftUI
import SwiftData


struct ChatsNavbar: View {
    @Environment(\.colorScheme) var colorScheme
    @State var search = ""
    @Binding var popover: Bool
    
    var body: some View {
        VStack {
            GeometryReader { geometry in
                VStack {
                    Spacer(minLength: 50)
                    HStack {
                        Text("Your Chats")
                            .font(.headline)
                        Spacer(minLength: 50)
                        
                        Button(action: {
                            popover = true
                        }){
                            Image(systemName: "plus")
                                .padding(.all, 8)
                                .foregroundStyle(colorScheme == .dark ? Theme.Color.neutral500 : .black)
                                .bold()
                                .font(.footnote)
                                .background(Theme.Color.neutral800)
                                .clipShape(Circle())
                                
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
        
    }
        
}

#Preview {
    @State var popover = false
    return ChatsNavbar(popover: $popover)
}
