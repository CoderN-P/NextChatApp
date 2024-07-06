//
//  getTimeString.swift
//  Next Chat
//
//  Created by Neel P on 7/2/24.
//

import Foundation


func getTimeString(_ date: Date) -> String {
    
    let timeString = date.formatted(date: .omitted, time: .shortened)
    
    if Calendar.current.isDateInToday(date){
        return "Today at \(timeString)"
    }
    
    if Calendar.current.isDateInYesterday(date){
        return "Yesterday at \(timeString)"
    }
    
    let dateString = date.formatted(date: .numeric, time: .omitted)
    
    return "\(dateString) \(timeString)"
}
