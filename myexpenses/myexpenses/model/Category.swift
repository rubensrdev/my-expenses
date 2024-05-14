//
//  Category.swift
//  myexpenses
//
//  Created by Ruben on 13/5/24.
//

import Foundation
import SwiftData

@Model
class Category {
    @Attribute(.unique)
    var id: UUID
    var name: String
    
    init(id: UUID, name: String) {
        self.id = id
        self.name = name
    }
    
}


