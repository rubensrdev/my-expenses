//
//  CreateExpenseSheetView.swift
//  myexpenses
//
//  Created by Ruben on 14/5/24.
//

import SwiftUI
import SwiftData
import Combine

struct CreateExpenseSheetView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Binding var isShowingNewExpenseSheet: Bool
    @State private var name = ""
    @State private var currency = Currency.EUR
    @State private var operations: [Operation] = []
    @State private var balance = 0.0
    
    var body: some View {
        NavigationView {
            VStack {
                Form {
                    Section(header: Text("Sheet data")) {
                        
                        TextField("Name", text: $name)
                        
                        Picker("Currency", selection: $currency) {
                            ForEach(Currency.allCases) { option in
                                    Text(String(describing: option))
                            }
                        }
                        //.pickerStyle(.wheel)
                        
                        Stepper("\(balance) \(currency)", value: $balance)
                        
                        /*
                        TextField("Balance", text: $balance)
                            .keyboardType(.numberPad)
                            .onReceive(Just(balance)) { newValue in
                                let filtered = newValue.filter { "0123456789".contains($0) }
                                if filtered != newValue {
                                    self.balance = filtered
                                }
                            }
                         */
                        
                        Button(
                            action: { saveExpenseSheet() },
                            label: { Text("Save") }
                        )
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(.vertical)
                        .disabled(name.isEmpty)
                        .buttonStyle(.borderedProminent)
                                            
                            
                    }
                }
            }
            .navigationTitle(Text("New expense sheet"))
        }
    }
    
    func saveExpenseSheet() {
        print("Saving new expense sheet...")
        let expenseSheetToSave = ExpenseSheet(id: .init(), name: name, currency: currency, operations: operations, balance: balance) // (balance as NSString).doubleValue
        modelContext.insert(expenseSheetToSave)
        isShowingNewExpenseSheet = false
    }
}

/*
#Preview {
    CreateExpenseSheetView(isShowingNewExpenseSheet: )
}
*/
