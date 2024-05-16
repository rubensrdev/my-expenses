//
//  FaqView.swift
//  myexpenses
//
//  Created by Ruben on 16/5/24.
//

import SwiftUI

struct FaqView: View {
    
    @Binding var isShowingFaqView: Bool
    
    var body: some View {
        VStack {
            
            Text("FAQ")
                .font(.title)
                .bold()
            
            DisclosureGroup("What is the purpose of this app?") {
                Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nunc nisl ante, ultrices eget rutrum vel, viverra eget odio. Mauris a ullamcorper dui, nec pulvinar metus.")
            }
            
        }
    }
}

/*
 #Preview {
 FaqView()
 }
 */
