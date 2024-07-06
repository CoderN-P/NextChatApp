//
//  MemberCard.swift
//  Next Chat
//
//  Created by Neel P on 7/5/24.
//

import SwiftUI
import SwiftData

struct MemberCard: View {
    var user: User
    @Environment(\.colorScheme) var colorScheme
    
    var body: some View {
        HStack(spacing: 15) {
            AsyncImage(url: URL(string: user.image)){ image in
                image.resizable()
            } placeholder: {
                colorScheme == .dark ? Theme.Color.gray900 : Theme.Color.gray200
            }
            .frame(minWidth: 40, maxWidth: 40, minHeight: 40, maxHeight: 40)
            .clipShape(Circle())
            
            VStack(alignment: .leading) {
                Text(user.name)
                    .font(.subheadline)
                    .bold()
                    .foregroundStyle(colorScheme == .dark ? .white : .black)
                
                Text(user.email)
                    .font(.caption)
            }
            
            Spacer()
        }
        .padding()
        .frame(maxWidth: .infinity)
        .background( colorScheme == .dark ? Theme.Color.neutral950 : Theme.Color.neutral50 )
        .clipShape(RoundedRectangle(cornerRadius: 20))
        .overlay( /// apply a rounded border
            RoundedRectangle(cornerRadius: 20)
                .stroke(colorScheme == .dark ? Theme.Color.neutral800 : Theme.Color.neutral200, lineWidth: 1)
        )
    }
}

#Preview {
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: AppData.self, configurations: config)
    
    return MemberCard(user: defaultUser)
        .modelContainer(container)
}
