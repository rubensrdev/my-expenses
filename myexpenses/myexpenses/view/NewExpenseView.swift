//
//  NewExpenseView.swift
//  myexpenses
//
//  Created by Ruben on 21/5/24.
//

import SwiftUI
import SwiftData

struct NewExpenseView: View {
    
    @Environment(\.modelContext) private var modelContext
    
    @Binding var isShowingNewExpenseView: Bool
    
    @Query var categories: [Category]
    var categoryList: [Category] {
        categories.filter { $0.type == type }
    }
    
    @State var type: OperationType = .expense
    @State var amount: String = ""
    @State var note: String = ""
    @State var category: Category?
    @State var dateAndTime: Date = .now
    
    
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("New \(type) data")) {
                    
                    Picker("Operation Type", selection: $type) {
                        ForEach(OperationType.allCases) { opType in
                                Text(String(describing: opType))
                        }
                    }
                    
                    TextField("Amount", text: $amount)
                        .keyboardType(.numberPad)
                    
                    Picker("Category", selection: $category) {
                        ForEach(categoryList, id: \.self.id) { cat in
                            Text(cat.name).tag(cat as Category?)
                        }
                    }
                    
                    TextField("Note", text: $note)
                    
                    DatePicker("Date", selection: $dateAndTime)
                       
                    Button(
                        action: { save() },
                        label: { Text("Save") }
                    )
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.vertical)
                    .disabled(note.isEmpty && amount.isEmpty)
                    .buttonStyle(.borderedProminent)
                }
            }
        }
    }
    
    private func save() {
        print("Saving \(type) in category \(category?.name)...")
        if let categorySave = category {
            let operation: Operation = .init(id: .init(), operationType: type, amount: Double(amount) ?? 0, note: note, dateAndTime: dateAndTime, category: categorySave)
            modelContext.insert(operation)
            isShowingNewExpenseView = false
            print("closing this sheet")
        } else {
            print("Error saving operation")
        }
        
        
    }
}

/*
 #Preview {
 NewExpenseView()
 }
 */
