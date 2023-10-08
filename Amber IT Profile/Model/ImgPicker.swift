//
//  ImgPicker.swift
//  Amber IT Profile
//
//  Created by Md Abir Hossain on 07-10-2023.
//

import SwiftUI
import UIKit
import AVFoundation


enum ImgPicker {
    enum Source: String {
        case library, camera
    }
    
    enum PickerError: Error, LocalizedError {
        case unavailable
        case restricted
        case denied
        
        var errorDescription: String? {
            switch self {
            case .unavailable:
                return NSLocalizedString("There is no available camera on this device", comment: "")
            case .restricted:
                return NSLocalizedString("You are not allowed to access media capture devices.", comment: "")
            case .denied:
                return NSLocalizedString("You have explicitly denied permission for media capture. If you want to use camera for capture image please allow camera permission(You can change permission mode any time from Settings-> Privacy & Security-> Camera). Please click go to Settings and grant camera access for this application.", comment: "")
            }
        }
    }
    
    static func checkPermissions() throws {
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
            let authStatus = AVCaptureDevice.authorizationStatus(for: AVMediaType.video)
            switch authStatus {
            case .denied:
                throw PickerError.denied
            case .restricted:
                throw PickerError.restricted
            default:
                break
            }
        } else {
            throw PickerError.unavailable
        }
    }
    
    
    struct CameraErrorType {
        let error: ImgPicker.PickerError
        var message: String {
            error.localizedDescription
        }
//        let button = Button("Go To Settings", role: .destructive) {
//            if let url = URL.init(string: UIApplication.openSettingsURLString){
//                UIApplication.shared.open(url, options: [:], completionHandler: nil)
//            }
//        }
        let button = Button {
            if let url = URL.init(string: UIApplication.openSettingsURLString){
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        } label: {
            Text("Go To Settings")
        }

        
        
//        let button = Alert(
//            title: Text("Alert!!"),
//            message: Text("Do it?"),
//            primaryButton: .cancel(Text("Cancel")),
//            secondaryButton: .destructive(Text("Go To Settings")) {
//                // do something
//            }
//        )
        
    }
}
