//
//  Item.swift
//  IMC_calculator_ios
//
//  Created by opx-mac-mini-09 on 02/07/2024.
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
