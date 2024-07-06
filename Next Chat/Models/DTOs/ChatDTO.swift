//
//  ChatDTO.swift
//  Next Chat
//
//  Created by Neel P on 7/2/24.
//

import Foundation

struct ChatDTO: Identifiable, Codable {
    var _id: String
    var name: String
    var users: [String]
    var owner: String
    var messages: [MessageDTO]
    var createdAt: Date
    var avatar: String
    
    var id: String {
        return _id
    }
}
