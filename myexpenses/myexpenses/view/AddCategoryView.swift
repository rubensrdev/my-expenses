//
//  AddCategoryView.swift
//  myexpenses
//
//  Created by Ruben on 17/5/24.
//

import SwiftUI
import SFSymbolsPicker

struct AddCategoryView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Binding var isShowingAddCategoryView: Bool
    @State private var name = ""
    @State private var type = OperationType.expense
    @State private var icon = "list.bullet"
    @State private var isPresented = false
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("Category data")) {
                    
                    TextField("Name", text: $name)
                    
                    Picker("Operation Type", selection: $type) {
                        ForEach(OperationType.allCases) { opType in
                                Text(String(describing: opType))
                        }
                    }
                    
                    Button("Select a symbol") {
                        isPresented.toggle()
                    }
                    .foregroundStyle(.black)
                    
                    Image(systemName: icon).font(.title3)
                        .sheet(
                            isPresented: $isPresented,
                            content: {
                                SymbolsPicker(selection: $icon, title: "Pick a symbol", autoDismiss: true)}
                        ).padding()

                                
                    
                    Button(
                        action: { saveCategory() },
                        label: { Text("Save") }
                    )
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(.vertical)
                    .disabled(name.isEmpty)
                    .buttonStyle(.borderedProminent)
                    
                }
                .padding()
            }
            .navigationTitle("Add new category")
        }
    
    }
    
    func saveCategory() {
        print("Saving Category...")
        let categoryToSave = Category(id: .init(), name: name, type: type, icon: icon)
        modelContext.insert(categoryToSave)
        isShowingAddCategoryView = false
    }
}

/*
 #Preview {
 AddCategoryView()
 }
 */
