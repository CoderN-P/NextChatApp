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
        VStack {
            Spacer()
            GeometryReader { geometry in
                Spacer()
                ZStack {
                    // Background with corner radius
                    RoundedRectangle(cornerRadius: 50)
                        .fill(.ultraThinMaterial)
                        .frame(maxWidth: .infinity, maxHeight: 50) // Ensure clickable area
                    
                    // TextField with padding and foreground color
                    HStack {
                        TextField(text: $text) {
                            Text("Send a message")
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
                            Image(systemName: "paperplane.fill")
                                .padding()
                                .foregroundStyle(Theme.Color.blue500)
                        }
                    }
                }
                .edgesIgnoringSafeArea(.bottom)
                .frame(height: 85)
                .position(x: geometry.size.width / 2, y: geometry.size.height - 50)
            }
            .padding(.top, 20)
            .padding(.leading, 20)
            .padding(.trailing, 20)
            .background(.ultraThinMaterial)
            .border(width: 1, edges: [.top], color: colorScheme == .dark ? Theme.Color.neutral800 : Theme.Color.neutral200)
            .frame(height: 85)
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
