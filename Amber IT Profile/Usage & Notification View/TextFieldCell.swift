//
//  TextFieldCell.swift
//  Amber IT Profile
//
//  Created by Tanvir Rahman on 4/10/23.
//

import SwiftUI

//struct TextFieldCell: View {
//    @State private var text: String = ""
//    var body: some View {
//        VStack{
//            TextFieldTitleAtUsageHistory(text: "Customer ID")
//            TextField("Enter Customer ID Here", text: $text)
//                .UseageHistoryTextFieldDesign(RectangeHeight: 57.7)
//        }
//    }
//}
//
//struct TextFieldCell_Previews: PreviewProvider {
//    static var previews: some View {
//        TextFieldCell()
//    }
//}
//

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
