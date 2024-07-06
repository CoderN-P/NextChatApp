//
//  checkGroup.swift
//  Next Chat
//
//  Created by Neel P on 7/2/24.
//

import Foundation


func checkGroup(_ start: Date, _ end: Date) -> Bool {
    let difference = end.timeIntervalSince(start)
        
    return difference >= 0 && difference <= 600
}
