//
//  ProfilePictureView.swift
//  Amber IT Profile
//
//  Created by Md Abir Hossain on 07-10-2023.
//

import SwiftUI

struct ProfilePictureView: View {
    // MARK: - Properties
    
    // Profile Picture
    @StateObject var profilePicture = ProfilePicture.shared
    
//    @State private var isSelectPicture: Bool = false
    @State var isEditProfilePicture: Bool = false
    @Binding var isMediaSelectionPopUp: Bool
    
    
    // MARK: - Body
    var body: some View {
        VStack {
            // Profile Image
            VStack {
                if let image = profilePicture.image {
                    Image(uiImage: image)
                        .resizable()
                        .foregroundColor(Color.white)
                        .clipShape(Circle())
                } else {
                    Image(systemName: "person.circle")
                        .resizable()
                        .foregroundColor(Color.white)
                        .clipShape(Circle())
                }
            }
        }
        .overlay (
            Circle()
                .stroke(Color.hotRed, lineWidth: 3)
                .overlay (
                    VStack {
                        if isEditProfilePicture {
                            Image("camera")
                                .frame(width: 17/393 * DeviceInfos().deviceWidth, height: 17/393 * DeviceInfos().deviceWidth)
                                .foregroundColor(Color.hotRed)
                                .padding([.trailing, .bottom], UIDevice.isIPad ? 12 : 5)
                                .onTapGesture(perform: {
                                    isMediaSelectionPopUp = true
//                                    profilePicture.source = .camera
//                                    profilePicture.showPhotoPicker()
                                })
                        }
                    }
                    , alignment: .bottomTrailing
                )
        )
        .padding(.top, 2)
        // Image Picker PopUp
        .fullScreenCover(isPresented: $profilePicture.showPicker) {
            ImagePickerView(sourceType: profilePicture.source == .library ? .photoLibrary : .camera, selectedImage: $profilePicture.image)
                .ignoresSafeArea()
        }
        
        // Image Error Warning
        .alert (isPresented: $profilePicture.showCameraAlert) {
            Alert(
                title: Text("Alert!"),
                message: Text("Camdera Permission Neeed"),
                dismissButton: .default(Text("Okay"), action: {
                    profilePicture.cameraError?.button
                })
            )}
        
        
//                @available(iOS 15.0, *)
//                .alert("Camdera Permission Neeed", isPresented: $profilePicture.showCameraAlert, presenting: profilePicture.cameraError, actions: { cameraError in
//                    cameraError.button
//                }, message: { cameraError in
//                    Text(cameraError.message)
//                })
    }
}

// MARK: - Preview
struct ProfilePictureView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilePictureView(isEditProfilePicture: false, isMediaSelectionPopUp: .constant(false))
    }
}
