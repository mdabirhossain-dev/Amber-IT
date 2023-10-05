//
//  TextFieldCell.swift
//  Amber IT Profile
//
//  Created by Tanvir Rahman on 4/10/23.
//

import SwiftUI


struct TextFieldTitleAtUsageHistory: View {
    var text: String
    
    var body: some View {
        HStack(spacing: 0){
            Text("\(text)")
                .font(.custom(FontManager.Poppins.semiBold, size: 14))
            Text("*")
                .foregroundColor(.red)
            Spacer()
        }.padding()
    }
}

struct UseageHistoryTextFieldDesignModifier: ViewModifier {
    var RectangeHeight: CGFloat
    func body(content: Content) -> some View {
        content
            .font(.custom(FontManager.Poppins.medium, size: 12))
            .padding(.horizontal, 10)
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.white, lineWidth: 1.5)
                    .frame(height: RectangeHeight)
            )
            .padding(.horizontal)
    }
}
extension View {
    
    func UseageHistoryTextFieldDesign(RectangeHeight: CGFloat) -> some View {
        modifier(UseageHistoryTextFieldDesignModifier(RectangeHeight: RectangeHeight))
    }
}
