//
//  generateSnowflake.swift
//  Next Chat
//
//  Created by Neel P on 7/5/24.
//

import Foundation

// Generates snowflake ids

func generateSnowflake() -> String {
    let epoch: TimeInterval = 1546300800000 // Custom epoch: January 1, 2019 in milliseconds
    let time = Date().timeIntervalSince1970 * 1000 - epoch
    let random = Int.random(in: 0..<1000)
    let snowflake = (Int64(time) * 1000) + Int64(random)
    return String(snowflake)
}

