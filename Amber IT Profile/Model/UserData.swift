//
//  UserData.swift
//  Amber IT Profile
//
//  Created by Md Abir Hossain on 3/10/23.
//

import Foundation


struct UserData {
    var id = UUID()
    var userFirstName: String = "No"
    var userLastName: String = "Name"
    var userFullName: String {
        return "\(userFirstName)" + " " + "\(userLastName)"
    }
    var userBirthDate: String = ""
}
