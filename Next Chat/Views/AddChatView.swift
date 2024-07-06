//
//  AddChatView.swift
//  Next Chat
//
//  Created by Neel P on 7/2/24.
//

import SwiftUI

struct AddChatView: View {
    @State private var useCode = false
    @State var text: String = ""
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        let selectedOutline = colorScheme == .dark ? Theme.Color.blue500 : Theme.Color.blue500
        let normalOutline = colorScheme == .dark ? Theme.Color.neutral600 : Theme.Color.neutral200
        
        VStack(alignment: .leading) {
            HStack {
                Text("Add chat")
                    .font(.title2)
                    .bold()
                Spacer()
                
                Button(action: {
                    useCode = true
                }){
                    Text("Code")
                        .padding()
                        .background(colorScheme == .dark ? Theme.Color.neutral900 : Theme.Color.neutral50)
                        .foregroundColor(colorScheme == .dark ? Theme.Color.neutral300 : Theme.Color.neutral400)
                        .bold()
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .overlay( /// apply a rounded border
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(useCode ? selectedOutline : normalOutline)
                    )
                }
                
                Button(action: {
                    useCode = false
                }){
                    Text("Name")
                        .padding()
                        .background(colorScheme == .dark ? Theme.Color.neutral900 : Theme.Color.neutral50)
                        .foregroundColor(colorScheme == .dark ? Theme.Color.neutral300 : Theme.Color.neutral400)
                        .bold()
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .overlay( /// apply a rounded border
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(useCode ? normalOutline : selectedOutline, lineWidth: 2)
                    )
                }
                
            }
            
            ZStack {
                // Background with corner radius
                RoundedRectangle(cornerRadius: 15)
                    .fill(.ultraThinMaterial)
                    .frame(maxWidth: .infinity, maxHeight: 50) // Ensure clickable area
                
                // TextField with padding and foreground color
                HStack {
                    TextField(text: $text) {
                        Text(useCode ? "Enter chat code" : "Enter chat name")
                            .bold()
                            .foregroundColor(Theme.Color.neutral400)
                            .frame(maxWidth: .infinity, minHeight: 44) // Ensure clickable area
                            .background(Color.clear) // Ensure background doesn't affect layout
                    }
                    .padding()
                    Spacer()
                    Button(action: {
                        return
                    }){
                        Image(systemName: "checkmark")
                            .padding()
                            .foregroundStyle(Theme.Color.blue500)
                    }
                }
            }
           
           Spacer()
        }
        .padding()
    }
}

#Preview {
    AddChatView()
}
