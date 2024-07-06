//
//  MemberSidebarView.swift
//  Next Chat
//
//  Created by Neel P on 7/2/24.
//

import SwiftUI

struct MemberView: View {
    @Environment(\.colorScheme) var colorScheme
    
    
    var body: some View {
        VStack {
            HStack{
                Text("Members")
                    .font(.title2)
                    .bold()
                
                Spacer()
                
                Button(action: {
                    return
                }){
                    Image(systemName: "plus")
                        .padding()
                        .foregroundStyle(colorScheme == .dark ? Theme.Color.neutral500 : .black)
                        .bold()
                        .font(.caption)
                        .background(Theme.Color.neutral900)
                        .clipShape(Circle())
                        .overlay(Circle()
                            .stroke(colorScheme == .dark ? Theme.Color.neutral600 : Theme.Color.neutral200)
                                 )
                }
            }
            Spacer()
        }
        .padding()
        
    }
}

#Preview {
    MemberView()
}
