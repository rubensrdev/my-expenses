//
//  ConfigurationView.swift
//  myexpenses
//
//  Created by Ruben on 15/5/24.
//

import SwiftUI

struct ConfigurationView: View {
    
    @Binding var isShowingConfigurationView: Bool
    @State var isShowingAboutView = false
    @State var isShowingFaqView = false
    @State var isShowingCategoryView = false
    
    var body: some View {
        NavigationStack {
            List {
                
            }
            .tint(.app)
            .navigationTitle(Text("Configuration"))
            .sheet(isPresented: $isShowingAboutView, content: {
               AboutView(isShowingAboutView: $isShowingAboutView)
            })
            .sheet(isPresented: $isShowingFaqView, content: {
               FaqView(isShowingFaqView: $isShowingFaqView)
            })
            .sheet(isPresented: $isShowingCategoryView, content: {
               FaqView(isShowingFaqView: $isShowingFaqView)
            })
        }
    }
}

/*
 #Preview {
 ConfigurationView()
 }
 */
