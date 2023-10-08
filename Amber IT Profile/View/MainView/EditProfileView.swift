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
    
    // Profile Picture
    @StateObject var profilePicture = ProfilePicture.shared
    @State private var isMediaSelectionPopUp: Bool = false
    
    // UserInfos
    @StateObject var userInfos = UserInfos.shared
    
    // Input Fields
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
    
    // Area Selection
    @State private var selectedCountry = "Country"
    @State private var selectedCity = "City"
    @State private var selectedArea = "Area"
    @State private var gotoNotificationView: Bool = false
    
    // MARK: - Functions
    func saveUserInfo() {
        // Saving to ViewModel
        userInfos.userData.userFirstName = firstName
        userInfos.userData.userLastName = lastName
    }
    
    // MARK: - Body
    var body: some View {
        
        ZStack{
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
                    ProfilePictureView(isEditProfilePicture: true, isMediaSelectionPopUp: $isMediaSelectionPopUp)
                        .frame(width: 91.68/393 * DeviceInfos().deviceWidth, height: 91.68/393 * DeviceInfos().deviceWidth)
                    
                    Text("Upload/Change Photo")
                        .font(.custom(FontManager.Montserrat.medium, size: 12))
                        .foregroundColor(Color.hotRed)
                        .padding(.vertical)
                    
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
            
            if isMediaSelectionPopUp {
                Color.black.opacity(0.3)
                    .ignoresSafeArea(.all)
                
                // Image selection
                mediaSelectionPopUp()
            }
            
        }
        .navigationBarBackButtonHidden(true)
        .navigationBarHidden(true)
//        .toolbar {
//            ToolbarItem(placement: .navigationBarLeading) {
//                NavigationBarLeading(previousViewName: "Profile")
//            }
//
//            ToolbarItem(placement: .navigationBarTrailing) {
//                NavigationBarTrailing(gotoNotificationView: $gotoNotificationView)
//            }
//        }
        
    }
    
    @ViewBuilder
    func mediaSelectionPopUp() -> some View {
        // MARK: - Your PopUp Content which will also perform navigations
        VStack(alignment: .leading) {
            VStack {
                Text("Choose")
                    .foregroundColor(Color.white)
                    .font(.system(size: 16, weight: .bold, design: .default))
            }
            .padding(20)
            
            HStack(alignment: .center) {
                // Camera Selection from PopUp
                Button(action: {
                    profilePicture.source = .camera
                    profilePicture.showPhotoPicker()
                    
                    self.isMediaSelectionPopUp = false
//                    withAnimation {self.isShowMedia = false}
                    
                }, label: {
                    Image(systemName: "camera.shutter.button.fill")
                        .frame(maxWidth: .infinity)
                        .font(.system(size: 30))
                        .foregroundColor(.white)
                })
                
                // Gallary Selection from PopUp
                Button(action: {
                    profilePicture.source = .library
                    profilePicture.showPhotoPicker()
                    
                    self.isMediaSelectionPopUp = false
//                    withAnimation {self.isShowMedia.toggle()}
                    
                }, label: {
                    Image(systemName: "photo.tv")
                        .frame(maxWidth: .infinity)
                        .font(.system(size: 30))
                        .foregroundColor(.white)
                })
            }
            
            HStack {
                Spacer()
                Button(action: {
                    self.isMediaSelectionPopUp = false
                }, label: {
                    Text("Cancel")
                        .foregroundColor(Color.white)
                })
                .padding(20)
            }
        }
        .frame(width: 331/392 * DeviceInfos().deviceWidth - 60, height: 180/852 * DeviceInfos().deviceHeight)
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
struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
            .preferredColorScheme(.dark)
    }
}
