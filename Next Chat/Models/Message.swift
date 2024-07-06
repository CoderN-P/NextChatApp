//
//  Message.swift
//  Next Chat
//
//  Created by Neel P on 7/2/24.
//

import Foundation
import SwiftData


@Model
class Message {
    @Attribute(.unique) var _id: String
    var content: String
    var sender: String
    var sendDate: Date
    
    init(_id: String?, content: String, sender: String, sendDate: Date){
        self._id = _id ?? generateSnowflake()
        self.content = content
        self.sender = sender
        self.sendDate = sendDate
    }
    
    convenience init(_ item: MessageDTO){
        self.init(
            _id: item._id,
            content: item.content,
            sender: item.sender,
            sendDate: item.sendDate
        )
    }
}
