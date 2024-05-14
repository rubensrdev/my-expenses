//
//  Enum.swift
//  myexpenses
//
//  Created by Ruben on 13/5/24.
//

import Foundation

enum OperationType: Codable {
    case expense, income
}

enum Currency: Codable  {
    case EUR, USD, GBP, JPY, AUD, CAD, CHF, CNH
}
