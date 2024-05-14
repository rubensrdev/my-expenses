//
//  Expense.swift
//  myexpenses
//
//  Created by Ruben on 13/5/24.
//

import Foundation
import SwiftData

@Model
class Operation {
    
    @Attribute(.unique)
    var id: UUID
    var operationType: OperationType
    var amount: Double
    var note: String
    var dateAndTime: Date
    var category: Category
    
    init(id: UUID, operationType: OperationType, amount: Double, note: String, dateAndTime: Date, category: Category) {
        self.id = id
        self.operationType = operationType
        self.amount = amount
        self.note = note
        self.dateAndTime = dateAndTime
        self.category = category
    }
    
}


