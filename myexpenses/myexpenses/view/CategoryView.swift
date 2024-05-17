//
//  CategoryView.swift
//  myexpenses
//
//  Created by Ruben on 16/5/24.
//

import SwiftUI
import SwiftData

struct CategoryView: View {
    
    @Binding var isShowingCategoryView: Bool
    
    @Environment(\.modelContext) private var modelContext
    @Query private var categories: [Category]
    
    @State private var searchText = ""
    @State private var typeSelected = OperationType.expense
    @State private var isShowingNewCategoryView = false
    
    
    var body: some View {
        
        VStack {
            
            NavigationStack {
                
                ZStack {
                    
                    Color.btnBack
                    
                    HStack {
                        
                        Button(
                            action: { typeSelected = OperationType.expense },
                            label: { Text("Expense") }
                        )
                        .padding()
                        .foregroundStyle(.white)
                        .background(typeSelected == OperationType.expense ? .btnSelected : .btnBack)
                        .clipShape(
                            Capsule()
                        )
                        
                        
                        Button(
                            action: { typeSelected = OperationType.income },
                            label: { Text("Income") }
                        )
                        .padding()
                        .foregroundStyle(.white)
                        .background(typeSelected == OperationType.income ? .btnSelected : .btnBack)
                        .clipShape(
                            Capsule()
                        )
                        
                    }
                }
                .frame(width: 215, height: 65)
                .compositingGroup()
                .cornerRadius(10)
                
                List {
                    ForEach(searchResults, id: \.self) { category in
                        NavigationLink(value: category) {
                            Image(systemName: "\(category.icon)")
                            Text("\(category.name)")
                        }
                    }
                    .onDelete(perform: deleteCategory)
                }
                .navigationTitle("Manage categories")
                .sheet(isPresented: $isShowingNewCategoryView, content: { AddCategoryView(isShowingAddCategoryView: $isShowingNewCategoryView) })
                
                Group {
                    Button(
                        action: { isShowingNewCategoryView = true },
                        label: { Label("Add new category", systemImage: "plus.circle") }
                    )
                }
                .frame(alignment: .bottomTrailing)
                .padding()
                
            }
            .searchable(text: $searchText)
        }
        .padding()
        
    }
    
    var searchResults: [Category] {
        if searchText.isEmpty {
            return categories.filter { $0.type == typeSelected }
        } else {
            return categories.filter { $0.name.contains(searchText) && $0.type == typeSelected }
        }
    }
    
    private func deleteCategory(offsets: IndexSet) {
        withAnimation {
            for i in offsets {
                modelContext.delete(categories[i])
            }
        }
    }
    
}

/*
 #Preview {
 CategoryView()
 }
 */
