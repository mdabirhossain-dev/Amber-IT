//
//  ProfileView.swift
//  Amber IT Profile
//
//  Created by Md Abir Hossain on 27/9/23.
//

import SwiftUI

struct ProfileView: View {
    // MARK: - Properties
    @StateObject var userInfos = UserInfos.shared
    
    @State private var isShowInformation: Bool = false
    @State private var gotoNotificationView: Bool = false
    // MARK: - Body
    var body: some View {
        VStack {
            NavigationBar(content: {
                Image("amberLogo")
                    .frame(width: 21, height: 33)
            }, gotoNotificationView: $gotoNotificationView)
            
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    // User Info
                    HStack(spacing: 12) {
                        // Profile Picture
                        Image(systemName: "person.circle")
                            .resizable()
                            .foregroundColor(Color.white)
                            .frame(width: 65, height: 65)
                            .overlay(
                                Circle()
                                    .stroke(Color.hotRed, lineWidth: 3)
                            )
                        
                        VStack(alignment: .leading, spacing: 3) {
                            Text(userInfos.userData.userFullName)
                                .font(.custom(FontManager.Poppins.semiBold, size: 12))
                            
                            // Will Navigate to ProfileEditView
                            NavigationLink(destination: EditProfileView()) {
                                Text("Edit Profile")
                                    .padding(.vertical, 6)
                                    .padding(.horizontal, 8)
                                    .font(.custom(FontManager.Poppins.medium, size: 10))
                                    .background(
                                        RoundedRectangle(cornerRadius: 18.5)
                                            .fill(Color.hotRed)
                                    )
                            }
                        }
                        
                        Spacer()
                        
                        // Due and payment infos
                        VStack(alignment: .trailing, spacing: 5) {
                            Text("Due: ৳650.0")
                                .font(.custom(FontManager.Poppins.semiBold, size: 14))
                            
                            Text("Payment Date: 31-09-2023  ")
                                .font(.custom(FontManager.Poppins.medium, size: 8))
                            
                            Button {
                                
                            } label: {
                                Text("Payment")
                                    .padding(.vertical, 6)
                                    .padding(.horizontal, 8)
                                    .font(.custom(FontManager.Poppins.medium, size: 10))
                                    .background(
                                        RoundedRectangle(cornerRadius: 18.5)
                                            .fill(Color.hotRed)
                                    )
                            }
                        }
                    }
                    .padding(.vertical, 10)
                    .padding(.horizontal, 16)
                    .foregroundColor(Color.white)
                    .frame(maxWidth: .infinity, maxHeight: 86)
                    .background(Color.darkRed)
                    .padding(.bottom, 30)
                    
                    VStack {
                        NavigationLink(destination: InternetPackageView()) {
                            ProfileOptionView(image: "crown", title: "Internet Packages")
                        }
                        NavigationLink(destination: NotificationsView(), isActive: $gotoNotificationView) {
                            EmptyView()
                        }

                        NavigationLink(destination: AppSettingsView()) {
                            ProfileOptionView(image: "setting", title: "App Setting")
                        }
                        
                        NavigationLink(destination: AppSettingsView()) {
                            ProfileOptionView(image: "speed.play", title: "My Wishlist")
                        }
                        
                        // Information(Expandable)
                        Button {
                            withAnimation(.easeIn(duration: 0.2)) {
                                isShowInformation.toggle()
                            }
                        } label: {
                            ProfileOptionView(image: "info.i", title: "Information")
                        }
                        
                        VStack {
                            if isShowInformation {
                                NavigationLink(destination: Terms_And_Conditions().navigationBarBackButtonHidden(true)) {
                                    ProfileInformationExpandableView(title: "T&C")
                                }
                                
                                NavigationLink(destination: FrequentlyAskQuestions()) {
                                    ProfileInformationExpandableView(title: "FAQ")
                                }
                                
                                NavigationLink(destination: PrivacyNotice()) {
                                    ProfileInformationExpandableView(title: "Privacy Notice")
                                }
                            }
                        }
                        
                        NavigationLink(destination: UsageHistorySupportPage()) {
                            ProfileOptionView(image: "headphone.24:7", title: "Support")
                        }
                    }
                    .padding(.horizontal, 16)
                    
                    VStack(spacing: 9) {
                        // LogOut Button
                        Button {
                            
                        } label: {
                            Text("Log Out")
                                .font(.custom(FontManager.Poppins.medium, size: 14)) // Monsterrat - semibold
                                .foregroundColor(Color.white)
                                .frame(maxWidth: .infinity)
                                .frame(height: 42/853 * DeviceInfos().deviceHeight)
                                .background(
                                    LinearGradient(gradient: Gradient(colors: [Color(UIColor(red: 0.129, green: 0.129, blue: 0.129, alpha: 0.5).cgColor), Color(UIColor(red: 0.129, green: 0.129, blue: 0.129, alpha: 1).cgColor), Color(UIColor(red: 0.129, green: 0.129, blue: 0.129, alpha: 0.5).cgColor)]), startPoint: .top, endPoint: .bottom)
                                    .cornerRadius(13)
                                )
                                .overlay (
                                    RoundedRectangle(cornerRadius: 13)
                                        .stroke(Color.hotRed, lineWidth: 2)
                                )
                            
                        }
                        .padding(.top, 53)
                        .padding(.horizontal, 33)
                        
                        Button {
                            
                        } label: {
                            Text("Delete Account")
                                .font(.custom(FontManager.Poppins.medium, size: 10)) // Monsterrat - semibold
                                .foregroundColor(Color.hotRed)
                        }
                        
                        // App Version
                        Text("App Version \(Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String ?? "Unknown")")
                            .font(.custom(FontManager.Poppins.medium, size: 10)) // Monsterrat - medium
                            .foregroundColor(Color.white)
                    }
                }
                Spacer()
            }
        }
        .preferredColorScheme(.dark)
    }
}

// MARK: - Preview
struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
