//
//  ExpenseView.swift
//  myexpenses
//
//  Created by Ruben on 14/5/24.
//

import SwiftUI

struct ExpenseView: View {
    
    @Bindable var expenseSheet: ExpenseSheet
    
    var body: some View {
        VStack() {
            Text("\(expenseSheet.name)")
                .font(.title)
                .bold()
            HStack {
                Text("Balance in sheet: ")
                if expenseSheet.balance >= 0 {
                    Text("\(expenseSheet.balance.formatted(.number))")
                        .frame(width: 100, height: 50)
                        .background(.capsule)
                        .foregroundStyle(.green)
                        .clipShape(.capsule)
                } else {
                    Text("\(expenseSheet.balance.formatted(.number))")
                        .frame(width: 100, height: 50)
                        .background(.capsule)
                        .foregroundStyle(.red)
                        .clipShape(.capsule)
                }
            }
            Spacer()
        }
    }
}

#Preview {
    ExpenseView(expenseSheet: .init(id: .init(), name: "Test Expense Sheet", currency: .EUR, operations: [], balance: -255.63))
}
