//
//  CreateExpenseSheetView.swift
//  myexpenses
//
//  Created by Ruben on 14/5/24.
//

import SwiftUI
import SwiftData

struct CreateExpenseSheetView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Binding var isShowingNewExpenseSheet: Bool
    
    var body: some View {
        VStack {
            Text("New expense sheet")
        }
    }
}

/*
#Preview {
    CreateExpenseSheetView(isShowingNewExpenseSheet: )
}
*/
