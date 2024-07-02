//
//  TextBoxView.swift
//  Next Chat
//
//  Created by Neel P on 7/2/24.
//

import SwiftUI
import TailwindCSS_SwiftUI

struct TextBoxView: View {
    @Environment(\.colorScheme) var colorScheme
    @Binding var text: String
    
    
    var body: some View {
        ZStack {
            // Background with corner radius
            RoundedRectangle(cornerRadius: 10)
                .fill(colorScheme == .dark ? Theme.Color.gray900 : Theme.Color.gray100)
                .frame(maxWidth: .infinity, maxHeight: 50) // Ensure clickable area
            
            // TextField with padding and foreground color
            HStack {
                TextField(text: $text) {
                    Text("Send a message")
                        .foregroundColor(colorScheme == .dark ? Theme.Color.gray500 : Theme.Color.gray400 )
                        .frame(maxWidth: .infinity, minHeight: 44) // Ensure clickable area
                        .background(Color.clear) // Ensure background doesn't affect layout
                }
                .padding()
                Spacer()
                Button(action: {
                    return
                }){
                    Image(systemName: "paperplane.fill")
                        .padding()
                        .foregroundStyle(Theme.Color.gray400)
                }
            }
        }
    }
}

#Preview {
    struct TextBoxPreview: View {
        @State var text: String = ""
        
        var body: some View {
            TextBoxView(text: $text)
        }
    }
    
    return TextBoxPreview()
}
