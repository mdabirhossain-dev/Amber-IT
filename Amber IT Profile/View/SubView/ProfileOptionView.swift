//
//  ProfileOptionView.swift
//  Amber IT Profile
//
//  Created by Md Abir Hossain on 27/9/23.
//

import SwiftUI

struct ProfileOptionView: View {
    // MARK: - Properties
    let image: String
    let title: String
        
    
    // MARK: - Body
    var body: some View {
        VStack {
            HStack(spacing: 16) {
                Image(image)
                
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
struct ProfileOptionView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileOptionView(image: "setting", title: "Demo Title")
            .preferredColorScheme(.dark)
    }
}
