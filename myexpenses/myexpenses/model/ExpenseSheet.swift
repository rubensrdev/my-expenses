//
//  ExpenseSheet.swift
//  myexpenses
//
//  Created by Ruben on 13/5/24.
//

import Foundation
import SwiftData

@Model
class ExpenseSheet {
    
    @Attribute(.unique)
    var id: UUID
    var name: String
    var currency: Currency
    @Relationship(deleteRule: .cascade)
    var operations: [Operation]
    var balance: Double
    
    init(id: UUID, name: String, currency: Currency, operations: [Operation], balance: Double) {
        self.id = id
        self.name = name
        self.currency = currency
        self.operations = operations
        self.balance = balance
    }
    
}


