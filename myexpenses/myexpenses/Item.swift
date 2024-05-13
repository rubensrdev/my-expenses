//
//  Item.swift
//  myexpenses
//
//  Created by Ruben on 13/5/24.
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