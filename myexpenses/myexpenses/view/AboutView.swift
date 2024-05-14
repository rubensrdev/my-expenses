//
//  AboutView.swift
//  myexpenses
//
//  Created by Ruben on 14/5/24.
//

import SwiftUI

struct AboutView: View {
    
    @Binding var isShowingAboutView: Bool
    
    var body: some View {
        VStack {
            
            Text("About this app")
                .bold()
                .font(.title)
                .padding()
            
            Text("""
                 This application has been developed by Rubén (isthebetadev) as part of his portfolio as an iOS developer.
                 
                 The purpose of this application is to help us manage our expenses and income to have better organization and personal financial education.
                 
                 """)
            
        }
        .padding()
    }
}

/*
 #Preview {
 AboutView()
 }
 */
