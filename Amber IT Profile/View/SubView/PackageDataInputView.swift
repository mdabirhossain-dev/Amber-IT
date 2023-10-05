//
//  PackageDataInputView.swift
//  Amber IT Profile
//
//  Created by Md Abir Hossain on 4/10/23.
//

import SwiftUI

struct PackageDataInputView: View {
    // MARK: - Properties
    let title: String
    @Binding var text: String
    
    // MARK: - Body
    var body: some View {
//        GeometryReader { geo in
            HStack {
                Text(title)
                    .frame(maxWidth: DeviceInfos().deviceWidth / 3, alignment: .leading)
                
                Spacer()
                
                Text(":")
                    .fontWeight(.semibold)
                    .padding(.trailing, 16/392 * (DeviceInfos().deviceWidth - 30))
                
                TextField("", text: $text)
                    .padding(.horizontal, 13)
                    .foregroundColor((Double(text) ?? 0.0) <= 0.0 ? Color.hotRed : Color.white)
                    .background(Color.appSettingButtonBackgroundGray)
                    .cornerRadius(3)
            }
            .font(.custom(FontManager.Poppins.regular, size: 12))
//        }
    }
}

struct PackageDataInputView_Previews: PreviewProvider {
    @State static var text: String = ""
    static var previews: some View {
        PackageDataInputView(title: "", text: $text)
    }
}
