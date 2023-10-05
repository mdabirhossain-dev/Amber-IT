//
//  ProfileInformationExpandableView.swift
//  Amber IT Profile
//
//  Created by Md Abir Hossain on 5/10/23.
//

import SwiftUI


struct ProfileInformationExpandableView: View {
    // MARK: - Properties
    let title: String
        
    // MARK: - Body
    var body: some View {
        VStack {
            HStack(spacing: 16) {
                Text(title)
                    .font(.custom(FontManager.Poppins.medium, size: 16))
                    .foregroundColor(Color.white)
                
                Spacer()
                
                Image("chevron.right")
                    .resizable()
                    .frame(width: 18, height: 18)
            }
            
            Divider()
        }
    }
}

// MARK: - Preview
struct ProfileInformationExpandableView_Previews: PreviewProvider {
    static var previews: some View {
    ProfileInformationExpandableView(title: "Demo Title")
            .preferredColorScheme(.dark)
    }
}
