//
//  PackageFormSubmissionPopUpView.swift
//  Amber IT Profile
//
//  Created by Md Abir Hossain on 5/10/23.
//

import SwiftUI

struct PackageFormSubmissionPopUpView: View {
    // MARK: - Properties
    
    // Package PopUp Show/Hide
    @Binding var isPackageSubmitted: Bool
    // Go to PackageForm
    @Binding var isForm: Bool
    
    // MARK: - Body
    var body: some View {
        let width = DeviceInfos().deviceWidth - 60
        let height = DeviceInfos().deviceHeight
        
        VStack(spacing: 0) {
            Image("thumb")
                .resizable()
                .frame(width: 50/392 * width, height: 57.69/892 * height)
                .padding(.bottom, 13.5)
            
            Text("Thank you for registration.")
                .font(.custom(FontManager.Poppins.semiBold, size: 20))
                .padding(.bottom, 10)
            
            Text("Concern department will contact you shortly")
                .font(.custom(FontManager.Poppins.semiBold, size: 12))
                .padding(.bottom, 20)
            
            Button {
                withAnimation {
                    isPackageSubmitted = false
                    isForm = false
                }
            } label: {
                Text("CLOSE")
                    .font(.custom(FontManager.Poppins.semiBold, size: 16))
                    .foregroundColor(Color(red: 0.73, green: 0.05, blue: 0.06))
                    .frame(width: 95/392 * width, height: 31/852 * height)
                    .background(Color.white)
                    .cornerRadius(5)
            }

        }
        .frame(width: 331/392 * width, height: 180/852 * height)
        .padding(10)
        .background(
            LinearGradient(gradient: Gradient(colors: [Color(red: 0.85, green: 0.06, blue: 0.08), Color(red: 0.35, green: 0, blue: 0.01)]), startPoint: .top, endPoint: .bottom)
        )
        .cornerRadius(5)
        .overlay(
            RoundedRectangle(cornerRadius: 5)
                .stroke(
                    LinearGradient(
                        colors: [Color(red: 0.92, green: 0.11, blue: 0.19), .white],
                        startPoint: .top,
                        endPoint: .bottom)
                    , lineWidth: 1.5)
        )
        .aspectRatio(contentMode: .fit)
    }
}

// MARK: - Preview
struct PackageFormSubmissionPopUpView_Previews: PreviewProvider {
    @State static var isPackageSubmitted: Bool = false
    @State static var isForm: Bool = false
    static var previews: some View {
        PackageFormSubmissionPopUpView(isPackageSubmitted: $isPackageSubmitted, isForm: $isForm)
    }
}
