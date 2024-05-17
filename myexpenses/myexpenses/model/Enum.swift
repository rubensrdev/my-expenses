//
//  Enum.swift
//  myexpenses
//
//  Created by Ruben on 13/5/24.
//

import Foundation

enum OperationType: Codable, CaseIterable, Identifiable, CustomStringConvertible {
    
    var id: Self { self }
    
    var description: String {
        switch self {
            
        case .expense:
            return "Expense"
        case .income:
            return "Income"
        }
    }
    
    case expense, income
}

enum Currency: Codable, CaseIterable, Identifiable, CustomStringConvertible  {
    
    var id: Self { self }
    
    case EUR, USD, GBP, JPY, AUD, CAD, CHF, CNH
    
    var description: String {
        switch self {
        case .EUR:
            return "EUR"
        case .USD:
            return "USD"
        case .GBP:
            return "GBP"
        case .JPY:
            return "JPY"
        case .AUD:
            return "AUD"
        case .CAD:
            return "CAD"
        case .CHF:
            return "CHF"
        case .CNH:
            return "CNH"
        }
    }
    
    
}
