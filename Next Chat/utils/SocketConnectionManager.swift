//
//  SocketConnectionManager.swift
//  Next Chat
//
//  Created by Neel P on 7/2/24.
//

import Foundation
import SocketIO


class SocketConnectionManager {
    var manager: SocketManager
    var socket: SocketIOClient
    
    
    init(url: URL, handleNewChat: @escaping (Array<Any>, SocketAckEmitter) -> (), handleNewUser: @escaping (Array<Any>, SocketAckEmitter) -> (), handleNewMessage: @escaping (Array<Any>, SocketAckEmitter) -> (), handleCreateChatError: @escaping (Array<Any>, SocketAckEmitter) -> ()){
        self.manager = SocketManager(socketURL: url)
        self.socket = manager.defaultSocket
        
        self.socket.on("new_chat", callback: handleNewChat)
        self.socket.on("new_user", callback: handleNewUser)
        self.socket.on("new_message", callback: handleNewMessage)
        self.socket.on("create_chat_error", callback: handleCreateChatError)
        
    }
    
    func join(chats: [String], user: User){
        for chat in chats {
            socket.emit("join", chat)
        }
        
        socket.emit("user_connect", user._id)
        user.status = "online"
    }
    
    func createChat(name: String, mode: String, user: User){
        if mode == "name" {
            socket.emit("new_chat", [
                "name": name,
                "users": [user._id],
                "owner": user._id,
                "avatar": user.image
            ])
        } else {
            socket.emit("join_chat", [
                "chatID": name,
                "userID": user._id
            ])
        }
    }
    
    func sendMessage(message: String, chat: Chat, user: User){
        let messageData = [
            "content": message,
            "sender": user._id,
            "chat": chat._id
        ]
        
        let messageObj = Message(
            _id: nil,
            content: message,
            sender: user._id,
            sendDate: Date()
        )
        
        let socketMessage = [
            "chatID": chat._id,
            "message": messageData
        ] as [String : Any]
        
        chat.messages.append(messageObj)
        
        socket.emit("message", socketMessage)
    }
}
