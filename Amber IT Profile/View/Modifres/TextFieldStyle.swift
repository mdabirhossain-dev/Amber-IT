//
//  TextFieldStyle.swift
//  OTT App
//
//  Created by Md Abir Hossain on 03-09-2023.
//

import Foundation
import SwiftUI

public struct TextFieldStyle: ViewModifier {
    var isPlaceHolder: Bool
    var placeholder: String

    public func body(content: Content) -> some View {
        ZStack(alignment: .leading) {
            if isPlaceHolder {
                Text(placeholder)
            }
            content
                .foregroundColor(Color.textForeground)
        }
    }
}
