//
//  PackageRegistrationFormView.swift
//  Amber IT Profile
//
//  Created by Md Abir Hossain on 4/10/23.
//

import SwiftUI

struct PackageRegistrationFormView: View {
    // MARK: - Properties
    @State private var fullName: String = ""
    @State private var cellNo: String = ""
    @State private var email: String = ""
    @State private var address: String = ""
    
    // Package Inpur
    @State private var mrc: String = ""
    @State private var otc: String = ""
    @State private var subTotal: String = ""
    @State private var discountMrc: String = ""
    @State private var discountOtc: String = ""
    @State private var netMrc: String = ""
    @State private var netOtc: String = ""
    @State private var totalNetPayable: String = ""
    @State private var verificationCode: String = ""
    @State private var code: String = ""
    
    
    @State private var isAgreeTermsAndCondition: Bool = false
    
    
    // Area Selection
    @State private var selectedCountry = "Bangladesh"
    @State private var selectedDistrict = ""
    @State private var selectedThana = ""
    @State private var selectedPackage = ""
    
    var districtName: [String] {
        return cityNames(countryName: selectedCountry)
    }
    var thanaName: [String] {
        return areaNames(city: selectedDistrict)
    }
    
    
    // PackageSubmissionPopUp
    @Binding var isPackageSubmitted: Bool
    
    
    // MARK: - Body
    var body: some View {
//        GeometryReader { geo in
//        let geo = UIScreen.main.bounds.size.width
            VStack(spacing: 15) {
                // Form Title
                Text("Customer Registration Form (Broadband Internet) for All\n \(Text("(Fields with \(Text("*").foregroundColor(Color.red)) are must required)").font(.custom(FontManager.Poppins.regular, size: 10)))")
                    .font(.custom(FontManager.Poppins.medium, size: 12))
                    .multilineTextAlignment(.center)
                
                
                HStack(spacing: 25/392 * DeviceInfos().deviceWidth) {
                    // Full Name
                    TextFieldRoundedBorderWithTitle(title: "Full Name", textFieldPlaceholder: "Enter your name as like NID", textField: $fullName, fieldHeight: 23/852 * DeviceInfos().deviceHeight)
                    
                    // Cell Number
                    TextFieldRoundedBorderWithTitle(title: "Mobile No.", textFieldPlaceholder: "Enter your valid mobile number", textField: $cellNo, fieldHeight: 23/852 * DeviceInfos().deviceHeight)
                        .keyboardType(.phonePad)
                }
                
                HStack(alignment: .firstTextBaseline, spacing: 25/392 * DeviceInfos().deviceWidth) {
                    // Email address
                    TextFieldRoundedBorderWithTitle(title: "Email Address", textFieldPlaceholder: "Enter your email address", textField: $email, fieldHeight: 23/852 * DeviceInfos().deviceHeight)
                        .keyboardType(.emailAddress)
                    
                    // District
                    Menu {
                        ForEach(0..<districtName.count, id: \.self) { index in
                            Button {
                                selectedDistrict = districtName[index]
                            } label: {
                                Text(districtName[index])
                                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                            }
                        }
                    } label: {
                        VStack(alignment: .leading, spacing: 9) {
                            Text("District\(Text("*").foregroundColor(Color.red))")
                                .font(.custom(FontManager.Poppins.semiBold, size: 14))
                            
                            HStack(spacing: 0) {
                                Text(selectedDistrict)
                                    .font(.custom(FontManager.Poppins.medium, size: 10))
                                    .padding(.horizontal, 10)
                                
                                Spacer()
                                
                                RoundedCorners(topLeft: 5, bottomRight: 5)
                                    .foregroundColor(Color.white)
                                    .frame(width: 23/852 * DeviceInfos().deviceHeight, height: 23/852 * DeviceInfos().deviceHeight)
                                    .overlay (
                                        Image("arrowDownTriangleBlack")
                                            .resizable()
                                            .frame(width: 12/392 * DeviceInfos().deviceWidth, height: 9/852 * DeviceInfos().deviceHeight)
                                    )
                            }
                            .frame(maxWidth: .infinity)
                            .frame(height: 23/852 * DeviceInfos().deviceHeight)
                            .background(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.white, lineWidth: 1.5)
                                    .frame(height: 23/852 * DeviceInfos().deviceHeight)
                            )
                        }
                    }
                }
                
                HStack(alignment: .top, spacing: 25/392 * DeviceInfos().deviceWidth) {
                    VStack(spacing: 15) {
                        // Upzila/Thana
                        Menu {
                            ForEach(0..<thanaName.count, id: \.self) { index in
                                Button {
                                    selectedThana = thanaName[index]
                                } label: {
                                    Text(thanaName[index])
                                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                                }
                            }
                        } label: {
                            VStack(alignment: .leading, spacing: 9) {
                                Text("Upzilla/Thana\(Text("*").foregroundColor(Color.red))")
                                    .font(.custom(FontManager.Poppins.semiBold, size: 14))
                                
                                HStack(spacing: 0) {
                                    Text(selectedThana)
                                        .font(.custom(FontManager.Poppins.medium, size: 10))
                                        .padding(.horizontal, 10)
                                    
                                    Spacer()
                                    
                                    RoundedCorners(topLeft: 5, bottomRight: 5)
                                        .foregroundColor(Color.white)
                                        .frame(width: 23/852 * DeviceInfos().deviceHeight, height: 23/852 * DeviceInfos().deviceHeight)
                                        .overlay (
                                            Image("arrowDownTriangleBlack")
                                                .resizable()
                                                .frame(width: 12/392 * DeviceInfos().deviceWidth, height: 9/852 * DeviceInfos().deviceHeight)
                                        )
                                }
                                .frame(maxWidth: .infinity)
                                .frame(height: 23/852 * DeviceInfos().deviceHeight)
                                .background(
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(Color.white, lineWidth: 1.5)
                                        .frame(height: 23/852 * DeviceInfos().deviceHeight)
                                )
                            }
                        }.disabled(selectedDistrict.isEmpty)
                        
                        // Package
                        Menu {
                            ForEach(0..<packageLists.count, id: \.self) { index in
                                Button {
                                    selectedPackage = packageLists[index]
                                } label: {
                                    Text(packageLists[index])
                                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                                }
                            }
                        } label: {
                            VStack(alignment: .leading, spacing: 9) {
                                Text("Package\(Text("*").foregroundColor(Color.red))")
                                    .font(.custom(FontManager.Poppins.semiBold, size: 14))
                                
                                HStack(spacing: 0) {
                                    Text(selectedPackage)
                                        .font(.custom(FontManager.Poppins.semiBold, size: 10))
                                        .padding(.horizontal, 10)
                                    
                                    Spacer()
                                    
                                    RoundedCorners(topLeft: 5, bottomRight: 5)
                                        .foregroundColor(Color.white)
                                        .frame(width: 23/852 * DeviceInfos().deviceHeight, height: 23/852 * DeviceInfos().deviceHeight)
                                        .overlay (
                                            Image("arrowDownTriangleBlack")
                                                .resizable()
                                                .frame(width: 12/392 * DeviceInfos().deviceWidth, height: 9/852 * DeviceInfos().deviceHeight)
                                        )
                                }
                                .frame(maxWidth: .infinity)
                                .frame(height: 23/852 * DeviceInfos().deviceHeight)
                                .background(
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(Color.white, lineWidth: 1.5)
                                        .frame(height: 23/852 * DeviceInfos().deviceHeight)
                                )
                            }
                        }
                    }
                    
                    // Address
//                    TextFieldRoundedBorderWithTitle(title: "Address", textFieldPlaceholder: "Enter your Address", textField: $address, fieldHeight: 76/852 * DeviceInfos().deviceHeight)
                    
                    VStack(alignment: .leading, spacing: 9){
                        TextFieldTitle(text: "Address")
//                        GeometryReader { geo in
                            TextField("Address", text: $address)
//                                .textFieldRoundedBorder(rectangeHeight: 76/852 * DeviceInfos().deviceHeight)
                                .padding(.horizontal, 10)
                                .background(
                                    RoundedRectangle(cornerRadius: 5)
                                        .stroke(Color.white, lineWidth: 1.5)
                                        .frame(height: 76/852 * DeviceInfos().deviceHeight)
                                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
                                )
//                        }
                    }
                }
                
                // Package Input
                VStack(spacing: 10/852 * DeviceInfos().deviceHeight) {
                    PackageDataInputView(title: "MRC", text: $mrc)
                    PackageDataInputView(title: "OTC", text: $otc)
                    PackageDataInputView(title: "Sub-Total", text: $subTotal)
                    PackageDataInputView(title: "Discount (MRC)", text: $discountMrc)
                    PackageDataInputView(title: "Discount (OTC)", text: $discountOtc)
                    PackageDataInputView(title: "Net MRC", text: $netMrc)
                    PackageDataInputView(title: "Net OTC", text: $netOtc)
                    PackageDataInputView(title: "Total Net Payable", text: $totalNetPayable)
                    
                    // Verification Code
                    HStack {
                        Text("Verification Code")
                            .frame(maxWidth: DeviceInfos().deviceWidth / 3, alignment: .leading)
                        
                        Spacer()
                        
                        Text(":")
                            .fontWeight(.semibold)
                            .padding(.trailing, 16/392 * (DeviceInfos().deviceWidth - 30))
                        
                        TextField("", text: $verificationCode)
                            .padding(.horizontal, 13)
                            .font(.custom(FontManager.Poppins.light, size: 20))
                            .foregroundColor(Color(red: 0.7, green: 0.7, blue: 0.7))
                            .multilineTextAlignment(.center)
                            .cornerRadius(5)
                            .keyboardType(.numberPad)
                            .background(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.white, lineWidth: 1.5)
                                    .frame(height: 33/852 * DeviceInfos().deviceHeight)
                            )
                    }
                    .font(.custom(FontManager.Poppins.regular, size: 12))
                    
                    // Code
                    HStack {
                        Text("Code")
                            .frame(maxWidth: DeviceInfos().deviceWidth / 3, alignment: .leading)
                        
                        Spacer()
                        
                        Text(":")
                            .fontWeight(.semibold)
                            .padding(.trailing, 16/392 * (DeviceInfos().deviceWidth - 30))
                        
                        TextField("Enter verification Code", text: $code)
                            .padding(.horizontal, 13)
                            .font(.custom(FontManager.Poppins.light, size: 10))
                            .foregroundColor(Color(red: 0.7, green: 0.7, blue: 0.7))
                            .cornerRadius(5)
                            .keyboardType(.numberPad)
                            .background(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(Color.white, lineWidth: 1.5)
                                    .frame(height: 23/852 * DeviceInfos().deviceHeight)
                            )
                    }
                    .font(.custom(FontManager.Poppins.regular, size: 12))
                }
                .keyboardType(.decimalPad)
                
                HStack(spacing: 3) {
                    Button {
                        withAnimation {
                            isAgreeTermsAndCondition.toggle()
                        }
                    } label: {
                        if isAgreeTermsAndCondition {
                            ZStack {
                                Image(systemName: "circle.fill")
                                    .scaleEffect(0.5)
                                Image(systemName: "circle")
                            }
                        } else {
                            Image(systemName: "circle")
                        }
                    }
                    .font(.system(size: 12/393 * DeviceInfos().deviceWidth))
                    .foregroundColor(Color.hotRed)
                    
                    Text("I agreed with the ") +
                    
                    Text("terms and conditions")
                        .foregroundColor(Color.hotRed)
                        .underline()
                }
                .font(.custom(FontManager.Poppins.regular, size: 10))
                
                Button {
                    withAnimation {
                        isPackageSubmitted = true
                    }
                } label: {
                    Text("SUBMIT")
                        .font(.custom(FontManager.Poppins.semiBold, size: 20))
                        .frame(width: 135/392 * DeviceInfos().deviceWidth, height: 35/852 * DeviceInfos().deviceHeight)
                        .background(Color.hotRed)
                }
                .cornerRadius(5)
            }
            .foregroundColor(Color.white)
//        }
    }
}

struct PackageRegistrationFormView_Previews: PreviewProvider {
    @State static var isPackageSubmitted = false
    static var previews: some View {
        PackageRegistrationFormView(isPackageSubmitted: $isPackageSubmitted)
    }
}
