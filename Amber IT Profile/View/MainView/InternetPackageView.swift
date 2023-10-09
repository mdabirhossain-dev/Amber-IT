//
//  InternetPackageView.swift
//  Amber IT Profile
//
//  Created by Md Abir Hossain on 3/10/23.
//

import SwiftUI

struct InternetPackageView: View {
    // MARK: - Properties
    
    // Dismiss view
    @Environment(\.presentationMode) var presentation
    
    // Plan Selection
    @State private var planSelectionIndex: Int = 0
    
    
    // PackageSubmissionPopUp
    @State private var isPackageSubmitted: Bool = false
    @State private var isForm: Bool = false
        
    
    // MARK: - Body
    var body: some View {
        ZStack {
            VStack(spacing: 25) {
                // NavigationBar
                NavigationBar {
                    HStack(spacing: 11) {
                        Button {
                            // Dismissing from this view
                            presentation.wrappedValue.dismiss()
                        } label: {
                            Image("arrow-left")
                                .resizable()
                                .frame(width: 24, height: 24)
                                .foregroundColor(Color.white)
                        }
                        
                        Text("Packages")
                            .font(.custom(FontManager.Poppins.semiBold, size: 18))
                    }
                }
                
                // Selection
                GeometryReader { geo in
                    HStack(spacing: 0) {
                        Button {
                            withAnimation {
                                planSelectionIndex = 0
                            }
                        } label: {
                            Text("View Plans")
                                .frame(width: geo.size.width / 2, height: 32/852 * DeviceInfos().deviceHeight)
                                .background(planSelectionIndex == 0 ? Color.hotRed : Color.profileTextFieldBackgroundGray)
                        }
                        
                        Button {
                            withAnimation {
                                planSelectionIndex = 1
                            }
                        } label: {
                            Text("Payment History")
                                .frame(width: geo.size.width / 2, height: 32/852 * DeviceInfos().deviceHeight)
                                .background(planSelectionIndex == 1 ? Color.hotRed : Color.profileTextFieldBackgroundGray)
                        }
                    }
                    .foregroundColor(Color.white)
                    .cornerRadius(7)
                }
                .frame(width: DeviceInfos().deviceWidth - 30, height: 32/852 * DeviceInfos().deviceHeight)
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 12) {
                        if planSelectionIndex == 0 {
                            if !isForm {
                                PackageListView(isForm: $isForm)
                                    .padding(.horizontal, 25)
                            } else {
                                PackageRegistrationFormView(isPackageSubmitted: $isPackageSubmitted, isForm: $isForm)
                                    .padding(.horizontal, 15)
                            }
                        } else if planSelectionIndex == 1 {
                            PaymentHistoryListView()
                        } else {
                            EmptyView()
                        }
                    }
                    
                    
                    Spacer()
                }
            }
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
            
            if isPackageSubmitted {
                Color.black.opacity(0.7)
                    .ignoresSafeArea(.all)
                
                PackageFormSubmissionPopUpView(isPackageSubmitted: $isPackageSubmitted, isForm: $isForm)
            }
        }
    }
}

// MARK: - Preview
struct InternetPackageView_Previews: PreviewProvider {
    static var previews: some View {
        InternetPackageView()
    }
}
