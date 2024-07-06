//
//  MessageDTO.swift
//  Next Chat
//
//  Created by Neel P on 7/2/24.
//

import Foundation

struct MessageDTO: Identifiable, Codable {
    var _id: String
    var content: String
    var sender: String
    var sendDate: Date
    
    var id: String {
        return _id
    }
}
