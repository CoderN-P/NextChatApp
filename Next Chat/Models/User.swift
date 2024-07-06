//
//  User.swift
//  Next Chat
//
//  Created by Neel P on 7/2/24.
//

import Foundation
import SwiftData

@Model
class User {
    @Attribute(.unique) var _id: String
    var name: String
    var email: String
    var image: String
    var createdAt: Date
    var friends: [String]
    var chats: [String]
    var status: String
    var customStatus: String
    var lastReadChat: String
    var googleId: String
    var phoneNumber: String
    
    init(_id: String, name: String, email: String, image: String, createdAt: Date, friends: [String], chats: [String], status: String, customStatus: String, lastReadChat: String, googleId: String, phoneNumber: String){
        self._id = _id
        self.name = name
        self.email = email
        self.image = image
        self.createdAt = createdAt
        self.friends = friends
        self.chats = chats
        self.status = status
        self.customStatus = customStatus
        self.lastReadChat = lastReadChat
        self.googleId = googleId
        self.phoneNumber = phoneNumber
    }
    
    convenience init(_ item: UserDTO){
        self.init(
            _id: item._id,
            name: item.name,
            email: item.email,
            image: item.image,
            createdAt: item.createdAt,
            friends: item.friends,
            chats: item.chats,
            status: item.status,
            customStatus: item.customStatus,
            lastReadChat: item.lastReadChat,
            googleId: item.googleId,
            phoneNumber: item.phoneNumber
        )
    }
}


