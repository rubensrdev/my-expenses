//
//  ExpenseView.swift
//  myexpenses
//
//  Created by Ruben on 14/5/24.
//

import SwiftUI
import SwiftData

struct ExpenseView: View {
    
    @Bindable var expenseSheet: ExpenseSheet
    @Environment(\.modelContext) private var modelContext
    @Query private var operations: [Operation]
    @State var isShowingNewExpenseView: Bool = false
    
    var balance: Double  {
        var balanceResult: Double = 0
        for op in self.operations {
            if op.amount > 0 {
                balanceResult += op.amount
            }
            if op.amount < 0 {
                balanceResult -= op.amount
            }
        }
        return balanceResult
    }
    
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
            
            List {
                ForEach(operations, id: \.self.id) { operation in
                    //NavigationLink(value: operation) {
                        HStack {
                            Image(systemName: "\(operation.category.icon)")
                            VStack {
                                Text("\(operation.category.name)")
                                    .font(.title3)
                                Text("\(operation.note)")
                                    .font(.caption)
                            }
                            Text("\(operation.amount.rounded()) €")
                        }
                    //}
                }
            }
            .sheet(isPresented: $isShowingNewExpenseView, content: {
                NewExpenseView(isShowingNewExpenseView: $isShowingNewExpenseView)
            })
            
            Group {
                Button(
                    action: { isShowingNewExpenseView = true },
                    label: { Label("Add new expense", systemImage: "plus.circle").labelsHidden() }
                )
            }
            .frame(alignment: .bottomTrailing)
            .padding()
            
        }
    }
}

#Preview {
    ExpenseView(expenseSheet: .init(id: .init(), name: "Test Expense Sheet", currency: .EUR, operations: [], balance: -255.63))
}
