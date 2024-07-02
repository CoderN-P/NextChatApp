//
//  Item.swift
//  Next Chat
//
//  Created by Neel P on 7/2/24.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
