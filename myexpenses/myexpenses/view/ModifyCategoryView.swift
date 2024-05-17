//
//  ModifyCategoryView.swift
//  myexpenses
//
//  Created by Ruben on 17/5/24.
//

import SwiftUI
import SFSymbolsPicker

struct ModifyCategoryView: View {
    
    @Bindable var category: Category
    @State private var isPresented = false
    
    var body: some View {
        VStack {
            Form {
                Section(header: Text("Category data")) {
                    
                    TextField("Name", text: $category.name)
                    
                    Picker("Operation Type", selection: $category.type) {
                        ForEach(OperationType.allCases) { opType in
                                Text(String(describing: opType))
                        }
                    }
                    
                    Button("Select a symbol") {
                        isPresented.toggle()
                    }
                    .foregroundStyle(.black)
                    
                    Image(systemName: category.icon).font(.title3)
                        .sheet(
                            isPresented: $isPresented,
                            content: {
                                SymbolsPicker(selection: $category.icon, title: "Pick a symbol", autoDismiss: true)}
                        ).padding()
 
                }
            }
        }
    }
}

#Preview {
    ModifyCategoryView(category: Category(id: .init(), name: "Updatable category", type: .expense, icon: "car"))
}
