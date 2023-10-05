//
//  AppSettingsView.swift
//  Amber IT Profile
//
//  Created by Md Abir Hossain on 3/10/23.
//

import SwiftUI

struct AppSettingsView: View {
    // MARK: - Properties
    
    // Dismiss view
    @Environment(\.presentationMode) var presentation
        
    
    // MARK: - Body
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(alignment: .leading) {                
                VStack(alignment: .center, spacing: 25) {
                    // Title
                    HStack(spacing: 14) {
                        Image("connectToTV")
                            .resizable()
                            .frame(width: 27/392 * DeviceInfos().deviceWidth, height: 24.54/852 * DeviceInfos().deviceHeight)
                        
                        Text("Connect To TV")
                            .font(.custom(FontManager.Poppins.bold, size: 16))
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    // QR Code
                    VStack {
                        Text("Scan QR code")
                            .font(.custom(FontManager.Poppins.semiBold, size: 16))
                        
                        Text("Place qr code inside the frame to scan please\navoid shake to get results quickly")
                            .font(.custom(FontManager.Poppins.medium, size: 12))
                            .multilineTextAlignment(.center)
                        
                        Image("qrCode")
                            .resizable()
                            .frame(width: 123.5/392 * DeviceInfos().deviceWidth, height: 122.5/852 * DeviceInfos().deviceHeight)
                        
                        Button {
                            
                        } label: {
                            Text("scan your QR code")
                                .font(.custom(FontManager.Montserrat.light, size: 12))
                                .frame(width: 274/392 * DeviceInfos().deviceWidth, height: 32/852 * DeviceInfos().deviceHeight)
                                .background(Color.hotRed)
                        }
                        .cornerRadius(39)
                        
                        Button {
                            
                        } label: {
                            Text("Enter your Code")
                                .font(.custom(FontManager.Montserrat.light, size: 12))
                                .frame(width: 184/392 * DeviceInfos().deviceWidth, height: 32/852 * DeviceInfos().deviceHeight)
                                .background(Color.appSettingButtonBackgroundGray)
                        }
                        .cornerRadius(39)
                    }
                    
                    // Language
                    VStack {
                        // Title
                        HStack(spacing: 14) {
                            Image("language")
                                .resizable()
                                .frame(width: 27/392 * DeviceInfos().deviceWidth, height: 24.54/852 * DeviceInfos().deviceHeight)
                            
                            Text("Language")
                                .font(.custom(FontManager.Poppins.bold, size: 16))
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        Button {
                            
                        } label: {
                            HStack {
                                Text("Select your language")
                                    .font(.custom(FontManager.Montserrat.light, size: 12))
                                
                                Image("arrowDownTriangle")
                                    .resizable()
                                    .frame(width: 7/392 * DeviceInfos().deviceWidth, height: 4/852 * DeviceInfos().deviceHeight)
                            }
                            .frame(width: 184/392 * DeviceInfos().deviceWidth, height: 32/852 * DeviceInfos().deviceHeight)
                            .background(Color.appSettingButtonBackgroundGray)
                        }
                        .cornerRadius(39)
                    }
                    
                    // Data Saver Mode
                    VStack {
                        // Title
                        HStack(spacing: 14) {
                            Image("dataSaverMode")
                                .resizable()
                                .frame(width: 27/392 * DeviceInfos().deviceWidth, height: 24.54/852 * DeviceInfos().deviceHeight)
                            
                            Text("Data Saver Mode")
                                .font(.custom(FontManager.Poppins.bold, size: 16))
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                        
                        HStack(spacing: 11) {
                            Button {
                                
                            } label: {
                                Text("OFF")
                                    .font(.custom(FontManager.Montserrat.bold, size: 12))
                                    .frame(width: 61/392 * DeviceInfos().deviceWidth, height: 32/852 * DeviceInfos().deviceHeight)
                                    .background(Color.appSettingButtonBackgroundGray)
                            }
                            .cornerRadius(39)
                            
                            Button {
                                
                            } label: {
                                Text("ON")
                                    .font(.custom(FontManager.Montserrat.bold, size: 12))
                                    .frame(width: 61/392 * DeviceInfos().deviceWidth, height: 32/852 * DeviceInfos().deviceHeight)
                                    .background(Color.hotRed)
                            }
                            .cornerRadius(39)
                        }
                    }
                }
                .padding(.top, 45)
                Spacer()
            }
            .padding(.leading, 11)
            .foregroundColor(Color.white)
            .navigationBarBackButtonHidden(true)
            .navigationBarItems(leading:
            HStack(spacing: 5) {
                Button {
                    // Dismissing from this view
                    presentation.wrappedValue.dismiss()
                } label: {
                    Image("arrow-left")
                        .resizable()
                        .frame(width: 24, height: 24)
                }
                
                Text("App Setting")
                    .font(.custom(FontManager.Poppins.semiBold, size: 18))
            }

            )
        }
    }
}

// MARK: - Preview
struct AppSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        AppSettingsView()
            .preferredColorScheme(.dark)
    }
}
