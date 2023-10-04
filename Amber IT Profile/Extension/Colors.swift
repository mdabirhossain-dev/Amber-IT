//
//  Colors.swift
//  OTT App
//
//  Created by Md Abir Hossain on 03-09-2023.
//

import SwiftUI

extension Color {
    static let buttonBackground = Color("ButtonBackground")
    static let searchBarBackground = Color(red: 0.26, green: 0.26, blue: 0.26)
    static let supportItemBackground = Color("SupportItemBackground")
    static let textForeground = Color(red: 0.77, green: 0.77, blue: 0.77)
    static let hotRed = Color(red: 0.91, green: 0.2, blue: 0.19)
    static let darkRed = Color(red: 0.84, green: 0.1, blue: 0.16).opacity(0.4)
    static let profileTextFieldBackgroundGray = Color(red: 0.43, green: 0.43, blue: 0.43)
    static let appSettingButtonBackgroundGray = Color(red: 0.43, green: 0.43, blue: 0.43).opacity(0.5)
    
}


let gradientGray: Gradient = Gradient(colors: [Color(red: 0.29, green: 0.3, blue: 0.3), Color(red: 0.29, green: 0.3, blue: 0.3).opacity(0.5)])
