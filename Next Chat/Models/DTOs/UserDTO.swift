//
//  UserDTO.swift
//  Next Chat
//
//  Created by Neel P on 7/2/24.
//

import Foundation

struct UserDTO: Identifiable, Codable {
    var _id: String
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
    
    var id: String {
        return _id
    }
}
