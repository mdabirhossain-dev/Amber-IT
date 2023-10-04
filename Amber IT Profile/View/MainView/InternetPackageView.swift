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
        
    
    // MARK: - Body
    var body: some View {
        VStack(spacing: 25) {
            // NavigationBar
            HStack(spacing: 11) {
                Button {
                    // Dismissing from this view
                    presentation.wrappedValue.dismiss()
                } label: {
                    Image("arrow-left")
                        .resizable()
                        .frame(width: 24, height: 24)
                }
                
                Text("Packages")
                    .font(.custom(FontManager.Poppins.semiBold, size: 18))
            }
            .frame(maxWidth: .infinity, maxHeight: 40, alignment: .leading)
            
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
//            .padding(.horizontal, 15)
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 25) {
                    
                    VStack(spacing: 12) {
                        if planSelectionIndex == 0 {
                            PackageListView()
                                .padding(.horizontal, 25)
                        } else if planSelectionIndex == 1 {
                            PaymentHistoryListView()
                        } else {
                            EmptyView()
                        }
                    }
                    
                    
                    Spacer()
                }
            }
        }
        .navigationBarBackButtonHidden(true)
    }
}

// MARK: - Preview
struct InternetPackageView_Previews: PreviewProvider {
    static var previews: some View {
        InternetPackageView()
    }
}
