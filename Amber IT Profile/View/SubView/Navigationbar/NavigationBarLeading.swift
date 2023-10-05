//
//  NavigationBarLeading.swift
//  Amber IT Profile
//
//  Created by Md Abir Hossain on 5/10/23.
//

import SwiftUI

struct NavigationBarLeading: View {
    // MARK: - Properties
    // Dismiss view
    @Environment(\.presentationMode) var presentation
    
    // Title
    let previousViewName: String
    
    // MARK: - Body
    var body: some View {
        HStack(spacing: 8) {
            Button {
                // Dismissing from this view
                presentation.wrappedValue.dismiss()
            } label: {
                Image("arrow-left")
                    .resizable()
                    .frame(width: 24, height: 24)
            }

            
            Text(previousViewName)
                .font(.custom(FontManager.Poppins.semiBold, size: 18))
        }
    }
}

// MARK: - Properties
struct NavigationBarLeading_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarLeading(previousViewName: "")
    }
}
