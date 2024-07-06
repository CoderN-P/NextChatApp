//
//  Chat.swift
//  Next Chat
//
//  Created by Neel P on 7/2/24.
//

import Foundation
import SwiftData

@Model
class Chat {
    @Attribute(.unique) var _id: String
    var name: String
    var users: [String]
    var owner: String
    var messages: [Message]
    var createdAt: Date
    var avatar: String
    
    init(_id: String, name: String, users: [String], owner: String, messages: [Message], createdAt: Date, avatar: String){
        self._id = _id
        self.name = name
        self.users = users
        self.owner = owner
        self.messages = messages
        self.createdAt = createdAt
        self.avatar = avatar
    }
    
    convenience init(_ item: ChatDTO){
        self.init(
            _id: item._id,
            name: item.name,
            users: item.users,
            owner: item.owner,
            messages: item.messages.map() {message in
                Message(message)
            },
            createdAt: item.createdAt,
            avatar: item.avatar
        )
    }
}
