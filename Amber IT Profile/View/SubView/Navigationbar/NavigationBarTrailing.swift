//
//  NavigationBarTrailing.swift
//  Amber IT Profile
//
//  Created by Md Abir Hossain on 5/10/23.
//

import SwiftUI

struct NavigationBarTrailing: View {
    // MARK: - Properties
    
    
    // MARK: - Body
    var body: some View {
        HStack(spacing: 21) {
            Button {
                
            } label: {
                Image("screenCast")
            }
            
            // Navigate to SearchView
            Button {
                
            } label: {
                Image(systemName: "magnifyingglass")
            }
            
            // Navigate to Notification View
            NavigationLink(destination: NotificationsView()) {
                Image("bell")
                    .frame(width: 20.64, height: 22.97)
            }
        }
        .padding(.horizontal, 16)
        .foregroundColor(Color.white)
        .frame(maxWidth: .infinity, maxHeight: 40, alignment: .center)
        .background(Color.clear.blur(radius: 10))
    }
}

// MARK: - Properties
struct NavigationBarTrailing_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBarTrailing()
    }
}
