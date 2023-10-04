//
//  UserInfos.swift
//  Amber IT Profile
//
//  Created by Md Abir Hossain on 3/10/23.
//

import Foundation

class UserInfos: ObservableObject {
    
    static let shared = UserInfos()
    
    @Published var userData = UserData()
}
