//
//  TextFieldWhiteBorderedView.swift
//  Amber IT Profile
//
//  Created by Md Abir Hossain on 4/10/23.
//

import SwiftUI

// TextField
struct TextFieldRoundedBorderWithTitle: View {
    // MARK: - Properties
    var title: String
    var textFieldPlaceholder: String
    @Binding var textField: String
    let fieldHeight: CGFloat
    
    // MARK: - Body
    var body: some View {
        VStack(alignment: .leading, spacing: 9){
            TextFieldTitle(text: title)
            TextField(title, text: $textField)
            .textFieldRoundedBorder(rectangeHeight: fieldHeight)
        }
    }
}

// MARK: - Preview
struct TextFieldRoundedBorderWithTitle_Previews: PreviewProvider {
    @State static var textField: String = ""
    static var previews: some View {
        TextFieldRoundedBorderWithTitle(title: "", textFieldPlaceholder: "", textField: $textField, fieldHeight: 21.0)
    }
}



// MARK: - Title View
struct TextFieldTitle: View {
    var text: String

    var body: some View {
        Text("\(text)")
            .font(.custom(FontManager.Poppins.semiBold, size: 14)) +
        
        Text("*")
            .foregroundColor(.red)
    }
}


struct TextFieldRoundedBorder: ViewModifier {
    var rectangeHeight: CGFloat
    func body(content: Content) -> some View {
        content
            .padding(.horizontal, 10)
            .background(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(Color.white, lineWidth: 1.5)
                    .frame(height: rectangeHeight)
            )
    }
}
extension View {

    func textFieldRoundedBorder(rectangeHeight: CGFloat) -> some View {
        modifier(TextFieldRoundedBorder(rectangeHeight: rectangeHeight))
    }
}



