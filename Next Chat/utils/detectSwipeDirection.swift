//
//  detectSwipeDirection.swift
//  Next Chat
//
//  Created by Neel P on 7/4/24.
//

import Foundation
import SwiftUI

func detectSwipeDirection(value: DragGesture.Value) -> String {
        let horizontalTranslation = value.translation.width
        let verticalTranslation = value.translation.height
        
        if abs(horizontalTranslation) > abs(verticalTranslation) {
            if horizontalTranslation > 0 {
                return "Right"
            } else {
                return "Left"
            }
        } else {
            if verticalTranslation > 0 {
                return  "Down"
            } else {
                return "Up"
            }
        }
    }
