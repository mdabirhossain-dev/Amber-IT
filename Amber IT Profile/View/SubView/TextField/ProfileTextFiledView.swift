//
//  ProfileTextFiledView.swift
//  Amber IT Profile
//
//  Created by Md Abir Hossain on 1/10/23.
//

import SwiftUI

struct ProfileTextFiledView: View {
    // MARK: - Properties
    let fieldTitle: String
    let fieldPlaceholder: String
    @Binding var text: String
    
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(fieldTitle)
                .font(.custom(FontManager.Poppins.semiBold, size: 14))
            
            TextField(fieldPlaceholder, text: $text)
                .padding(.horizontal, 12)
                .frame(maxWidth: .infinity)
                .frame(height: 32/853 * DeviceInfos().deviceHeight)
                .background(Color.profileTextFieldBackgroundGray)
                .cornerRadius(10)
        }
        .foregroundColor(Color.white)
    }
}

// MARK: - Preview
struct ProfileTextFiledView_Previews: PreviewProvider {
    @State static var text: String = ""
    static var previews: some View {
        ProfileTextFiledView(fieldTitle: "Name", fieldPlaceholder: "enter your name", text: $text)
            .preferredColorScheme(.dark)
    }
}
