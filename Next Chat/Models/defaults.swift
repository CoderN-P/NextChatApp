//
//  defaults.swift
//  Next Chat
//
//  Created by Neel P on 7/4/24.
//

import Foundation


let defaultChat = Chat(
    _id: "11",
    name: "Test",
    users: ["109"],
    owner: "109",
    messages: [Message(_id: "5", content: "Hello **hi**", sender: "109", sendDate: Date())],
    createdAt: Date(),
    avatar: "https://images.unsplash.com/photo-1526763025764-2a8073a0cd43?w=800&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8NHx8bW9udW1lbnQlMjB2YWxsZXl8ZW58MHx8MHx8fDA%3D"
)

let defaultUser = User(
    _id: "109",
    name: "neel",
    email: "neel.parpia@gmail.com",
    image: "https://neelp.tech/static/images/codern_pfp.gif",
    createdAt: Date(),
    friends: [],
    chats: [],
    status: "",
    customStatus: "",
    lastReadChat: "",
    googleId: "",
    phoneNumber: ""
)
