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
                Button(
                    action: { isShowingCategoryView = true },
                    label: { Label("Manage categories", systemImage: "list.bullet") }
                )
                .foregroundStyle(.black)
                Button(
                    action: { print("TODO sincronizaiton in iCloud") },
                    label: { Label("Sync with iCloud", systemImage: "arrow.triangle.2.circlepath") }
                )
                .foregroundStyle(.black)
                Button(
                    action: { print("TODO export data to file") },
                    label: { Label("Export data", systemImage: "square.and.arrow.up") }
                )
                .foregroundStyle(.black)
                Button(
                    action: { isShowingFaqView = true },
                    label: { Label("FAQ", systemImage: "questionmark") }
                )
                .foregroundStyle(.black)
                Button(
                    action: { isShowingAboutView = true },
                    label: { Label("About", systemImage: "info.circle") }
                )
                .foregroundStyle(.black)
            }
            .navigationTitle(Text("Configuration"))
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(
                        action: { isShowingConfigurationView = false },
                        label: { Label("", systemImage: "xmark.circle").labelsHidden() }
                    )
                }
            }
            .sheet(isPresented: $isShowingAboutView, content: {
               AboutView(isShowingAboutView: $isShowingAboutView)
            })
            .sheet(isPresented: $isShowingFaqView, content: {
               FaqView(isShowingFaqView: $isShowingFaqView)
            })
            .sheet(isPresented: $isShowingCategoryView, content: {
               CategoryView(isShowingCategoryView: $isShowingCategoryView)
            })
        }
    }
}

/*
 #Preview {
 ConfigurationView()
 }
 */
