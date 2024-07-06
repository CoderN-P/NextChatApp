//
//  Next_ChatApp.swift
//  Next Chat
//
//  Created by Neel P on 7/2/24.
//

import SwiftUI
import SwiftData
import GoogleSignIn
import GoogleSignInSwift

@main
struct NextChatApp: App {
    @Environment(\.modelContext) var modelContext
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .onOpenURL { url in
                    GIDSignIn.sharedInstance.handle(url)
                }
                .onAppear {
                    GIDSignIn.sharedInstance.restorePreviousSignIn { user, error in
                        // Check if `user` exists; otherwise, do something with `error`
                        
                    }
                 }
        }
        .modelContainer(for: AppData.self)
    }
}
