//
//  DeviceType.swift
//  Amber IT Profile
//
//  Created by Md Abir Hossain on 1/10/23.
//

import Foundation
import UIKit


extension UIDevice {
    static var isIPad: Bool {
        UIDevice.current.userInterfaceIdiom == .pad
    }
    
    static var isIPhone: Bool {
        UIDevice.current.userInterfaceIdiom == .phone
    }
}
