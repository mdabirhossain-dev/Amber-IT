//
//  ProfilePicture.swift
//  Amber IT Profile
//
//  Created by Md Abir Hossain on 07-10-2023.
//

import UIKit


// Chat image View Model
class ProfilePicture: ObservableObject {
    
    static let shared = ProfilePicture()
    
    @Published var image: UIImage?
    @Published var showPicker = false
    @Published var source: ImgPicker.Source = .library
    @Published var showCameraAlert = false
    @Published var cameraError: ImgPicker.CameraErrorType?
    
    func showPhotoPicker() {
        do {
            if source == .camera {
                try ImgPicker.checkPermissions()
            }
            showPicker = true
        } catch {
            showCameraAlert = true
            cameraError = ImgPicker.CameraErrorType(error: error as! ImgPicker.PickerError)
        }
    }
}
