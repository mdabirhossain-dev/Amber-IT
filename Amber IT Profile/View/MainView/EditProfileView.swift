//
//  EditProfileView.swift
//  Amber IT Profile
//
//  Created by Md Abir Hossain on 1/10/23.
//

import SwiftUI

//var geoLocations: GeoLocations = Bundle.main.decode("GeoLocations.json")

struct EditProfileView: View {
    // MARK: - Properties
    @StateObject var userInfos = UserInfos.shared
    
    @State private var firstName: String = ""
    @State private var lastName: String = ""
    
    // Dismiss view
    @Environment(\.presentationMode) var presentation 
    
    // Selected BirthDate
    @State private var dateString: String = "DD/MM/YYYY"
    
    @State private var userGender: UserGender = .male
    
    // GeoLocations
//    @State private var countryName: [CountryName] = (geoLocations.data ?? [])
//    @State private var countryNames: Int = 0
    @State private var countryName = countryNames()
    var cityName: [String] {
        return cityNames(countryName: selectedCountry)
    }
    var areaName: [String] {
        return areaNames(city: selectedCity)
    }
    var selectedCountryFlag: String {
        return countryFlag(countryName: selectedCountry)
    }
    
    @State private var selectedCountry = "Country"
    @State private var selectedCity = "City"
    @State private var selectedArea = "Area"
    
    
    // MARK: - Functions
    func saveUserInfo() {
        // Saving to ViewModel
        userInfos.userData.userFirstName = firstName
        userInfos.userData.userLastName = lastName
    }
    
    
    // MARK: - Body
    var body: some View {
        VStack {
            // Navigation Bar
            NavigationBar(content: {
                Button {
                    // Dismissing from this view
                    presentation.wrappedValue.dismiss()
                } label: {
                    Image("arrow-left")
                        .resizable()
                        .frame(width: 24, height: 24)
                }

                
                Text("User Profile Edit")
                    .font(.custom(FontManager.Poppins.semiBold, size: 18))
            })
            
            ScrollView(.vertical, showsIndicators: false) {
                // Profile Image
                Image(systemName: "person.circle")
                    .resizable()
                    .foregroundColor(Color.white)
                    .frame(width: 91.68/393 * DeviceInfos().deviceWidth, height: 91.68/393 * DeviceInfos().deviceWidth)
                    .overlay(
                        Circle()
                            .stroke(Color.hotRed, lineWidth: 3)
                            .overlay (
                                Image("camera")
                                    .frame(width: 17/393 * DeviceInfos().deviceWidth, height: 17/393 * DeviceInfos().deviceWidth)
                                    .foregroundColor(Color.hotRed)
                                    .padding([.trailing, .bottom], UIDevice.isIPad ? 12 : 5)
                                , alignment: .bottomTrailing
                            )
                    )
                    .padding(.top, 2)
                
                VStack(spacing: 15) {
                    // First Namew
                    ProfileTextFiledView(fieldTitle: "First Name", fieldPlaceholder: "enter your first name", text: $firstName)
                    
                    // Last Name
                    ProfileTextFiledView(fieldTitle: "Last Name", fieldPlaceholder: "enter your last name", text: $lastName)
                    
                    let width = DeviceInfos().deviceWidth - 60
                    let height = DeviceInfos().deviceHeight
                    
                    // Birth date and gender
//                    GeometryReader { geo in
                        HStack(spacing: 30) {
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Date of Birth")
                                
                                HStack {
                                    Text(dateString)
                                    
                                    Spacer()
                                    
                                    DatePickerView(dateString: $dateString)
                                } // : HSTACK
                                .padding(.horizontal, 12/393 * width)
                                .frame(width: width / 2, height: 32/853 * DeviceInfos().deviceHeight)
                                .background(Color.profileTextFieldBackgroundGray)
                                .cornerRadius(10)
                            }
                            
                            VStack(alignment: .leading, spacing: 8) {
                                Text("Sex")
                                
                                HStack {
                                    Button {
                                        userGender = .male
                                    } label: {
                                        if userGender == .male {
                                            ZStack {
                                                Image(systemName: "circle.fill")
                                                    .scaleEffect(0.5)
                                                Image(systemName: "circle")
                                            }
                                        } else {
                                            Image(systemName: "circle")
                                        }
                                    }
                                    .font(.system(size: 12/393 * width))
                                    .foregroundColor(Color.hotRed)
                                    
                                    Text("Male")
                                        .font(.custom(FontManager.Poppins.medium, size: 12))
                                        .foregroundColor(Color.white)
                                    
                                    Spacer()
                                    
                                    Button {
                                        userGender = .female
                                    } label: {
                                        if userGender == .female {
                                            ZStack {
                                                Image(systemName: "circle.fill")
                                                    .scaleEffect(0.5)
                                                Image(systemName: "circle")
                                            }
                                        } else {
                                            Image(systemName: "circle")
                                        }
                                    }
                                    .font(.system(size: 12/393 * width))
                                    .foregroundColor(Color.hotRed)
                                    
                                    Text("Female")
                                        .font(.custom(FontManager.Poppins.medium, size: 12))
                                        .foregroundColor(Color.white)
                                    
                                    Spacer()
                                    
                                    Button {
                                        userGender = .others
                                    } label: {
                                        if userGender == .others {
                                            ZStack {
                                                Image(systemName: "circle.fill")
                                                    .scaleEffect(0.5)
                                                Image(systemName: "circle")
                                            }
                                        } else {
                                            Image(systemName: "circle")
                                        }
                                    }
                                    .font(.system(size: 12/393 * width))
                                    .foregroundColor(Color.hotRed)
                                    
                                    Text("Other")
                                        .font(.custom(FontManager.Poppins.medium, size: 12))
                                        .foregroundColor(Color.white)
                                    
                                }
                                .lineLimit(1)
                                .minimumScaleFactor(0.5)
                                .frame(width: width / 2, height: 32/853 * DeviceInfos().deviceHeight)
                            }
                        }
//                    } // : GEOMETRY
                    
                    HStack(spacing: 8) {
                        // Country Selection
                        VStack(alignment: .leading, spacing: 7) {
                            Text("Country")
                                .font(.custom(FontManager.Poppins.semiBold, size: 14))
                            
                            Menu {
                                ForEach(0..<countryName.count, id: \.self) { index in
                                    Button {
                                        selectedCountry = countryName[index]
                                    } label: {
                                        Text(countryName[index])
                                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                                    }

                                }
                            } label: {
                                Image("arrowDown")
                                    .resizable()
                                    .frame(width: 8/393 * width, height: 3/852 * height)
                                
                                if !selectedCountryFlag.isEmpty {
                                    Image(countryFlag(countryName: selectedCountry))
                                        .resizable()
                                        .frame(width: 18/393 * width, height: 10/852 * height)
                                }
                                
                                Text(selectedCountry)
                                    .font(.custom(FontManager.Poppins.medium, size: 12))
                            }
                            .padding(.leading, 7)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .frame(height: 32/852 * height) // width: 8/393 * width,
                            .background(Color.profileTextFieldBackgroundGray)
                            .cornerRadius(10)
                        }
                        
                    
                        // City Selection
                        VStack(alignment: .leading, spacing: 7) {
                            Text("City")
                                .font(.custom(FontManager.Poppins.semiBold, size: 14))
                            
                            Menu {
                                ForEach(0..<cityName.count, id: \.self) { index in
                                    Button {
                                        selectedCity = cityName[index]
                                    } label: {
                                        Text(cityName[index])
                                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                                    }
                                }
                            } label: {
                                Image("arrowDown")
                                    .resizable()
                                    .frame(width: 8/393 * width, height: 3/852 * height)
                                
                                Text(selectedCity)
                                    .font(.custom(FontManager.Poppins.medium, size: 12))
                            }
                            .padding(.leading, 7)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .frame(height: 32/852 * height) // width: 8/393 * width,
                            .background(Color.profileTextFieldBackgroundGray)
                            .cornerRadius(10)
                        }
                        
                        
                        // Area Selection
                        VStack(alignment: .leading, spacing: 7) {
                            Text("Area")
                                .font(.custom(FontManager.Poppins.semiBold, size: 14))
                            
                            Menu {
                                ForEach(0..<areaName.count, id: \.self) { index in
                                    Button {
                                        selectedArea = areaName[index]
                                    } label: {
                                        Text(areaName[index])
                                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                                    }
                                }
                            } label: {
                                Image("arrowDown")
                                    .resizable()
                                    .frame(width: 8/393 * width, height: 3/852 * height)
                                
                                Text(selectedArea)
                                    .font(.custom(FontManager.Poppins.medium, size: 12))
                            }
                            .padding(.leading, 7)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .frame(height: 32/852 * height) // width: 8/393 * width,
                            .background(Color.profileTextFieldBackgroundGray)
                            .cornerRadius(10)
                        }
                    }
                    .foregroundColor(Color.white)
                    .lineLimit(1)
                    .minimumScaleFactor(0.6)
                    
                    
                    // Update Button
                    Button {
                        // Save UserData
                        saveUserInfo()
                            // Dismissing from this view
                            self.presentation.wrappedValue.dismiss()
                    } label: {
                        Text("UPDATE")
                            .font(.custom(FontManager.Montserrat.bold, size: 18))
                            .frame(maxWidth: .infinity)
                            .frame(height: 48/852 * DeviceInfos().deviceHeight)
                            .foregroundColor(Color.white)
                            .background(Color.hotRed)
                            .cornerRadius(10)
                            .padding(.horizontal, 50)
                    } // : BUTTON
                    .padding(.top, 52)
                }
                .padding(.horizontal, 15)
                
                Spacer()
            } // : SCROLL
        } // : VSTACK
        .navigationBarBackButtonHidden(true)
    }
}

// MARK: - Preview
struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
            .preferredColorScheme(.dark)
    }
}
