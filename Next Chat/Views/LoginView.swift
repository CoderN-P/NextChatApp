//
//  LoginView.swift
//  Next Chat
//
//  Created by Neel P on 7/2/24.
//

import SwiftUI
import GoogleSignInSwift
import GoogleSignIn

struct LoginView: View {
    var body: some View {
        Text("Please log in")
            .font(.title)
        
        GoogleSignInButton(action: {
            signIn()
        })
        
        
    }
    
    func signIn(){
        guard let rootViewController = getRootViewController() else {
            print("could not find rootview controller")
                    return
                }
        
        GIDSignIn.sharedInstance.signIn(
            withPresenting: rootViewController) { signInResult, error in
                
              guard let result = signInResult else {
                // Inspect error
                return
              }
                
                let user = signInResult!.user
                
                print(user.profile?.email ?? "")
                print(user.profile?.name ?? "")
              // If sign in succeeded, display the app's main content View.
        }
    }
    
    func getRootViewController() -> UIViewController? {
            let scenes = UIApplication.shared.connectedScenes
            let windowScene = scenes.first as? UIWindowScene
            return windowScene?.windows.first?.rootViewController
        }
}

#Preview {
    LoginView()
}
