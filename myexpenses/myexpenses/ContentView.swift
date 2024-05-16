//
//  ContentView.swift
//  myexpenses
//
//  Created by Ruben on 13/5/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Query private var expenseSheets: [ExpenseSheet]
    @State var isShowingNewExpenseSheet = false
    @State var isShowingConfigurationView = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(expenseSheets) { expenseSheet in
                    NavigationLink(value: expenseSheet) {
                        HStack {
                            Text("\(expenseSheet.name)")
                        }
                    }
                }
            }
            .tint(.app)
            .navigationTitle("My Expenses")
            .navigationDestination(for: ExpenseSheet.self, destination: { expenseSheet in
                    ExpenseView(expenseSheet: expenseSheet)
            })
            .sheet(isPresented: $isShowingNewExpenseSheet, content: {
               CreateExpenseSheetView(isShowingNewExpenseSheet: $isShowingNewExpenseSheet)
            })
            .sheet(isPresented: $isShowingConfigurationView , content: {
               ConfigurationView(isShowingConfigurationView: $isShowingConfigurationView)
            })
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Menu(content: {
                        Button(action: { isShowingNewExpenseSheet = true } ) {
                            Label("New sheet", systemImage: "doc.badge.plus")
                        }
                        Button(action: { isShowingConfigurationView = true } ) {
                            Label("Configuration", systemImage: "gear")
                        }
                    }, label: {Label("Options", systemImage: "ellipsis.circle") })
                }
            }
            .overlay {
                if expenseSheets.isEmpty {
                    ContentUnavailableView(
                        label: {
                            Label("No sheets", systemImage: "doc.on.doc")
                                .foregroundColor(.gray)
                        }, description: {
                                Text("Click on \"New sheet\" to create a new one.")
                        })
                }
            }
        }
    }

    private func addItem() {
        withAnimation {
            // modelContext.insert(newItem)
        }
    }

    
}

#Preview {
    ContentView()
        .modelContainer(for: ExpenseSheet.self, inMemory: true)
}
