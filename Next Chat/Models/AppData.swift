//
//  AppData.swift
//  Next Chat
//
//  Created by Neel P on 7/2/24.
//

import Foundation
import SwiftData

@Model
class AppData {
    var user: User
    var chats: [Chat]
    var cachedUsers: [User]
    
    init(user: User, chats: [Chat], cachedUsers: [User]){
        self.user = user
        self.chats = chats
        self.cachedUsers = cachedUsers
    }
}
