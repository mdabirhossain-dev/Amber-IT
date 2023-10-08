//
//  MyWatchlistItemView.swift
//  Amber IT Profile
//
//  Created by Md Abir Hossain on 8/10/23.
//

import SwiftUI

struct MyWatchlistItemView: View {
    // MARK: - Properties
    let myWishlist: MyWishlist
    
    
    // MARK: - Body
    var body: some View {
        ZStack {
            Color(red: 0.37, green: 0.37, blue: 0.37)
                .ignoresSafeArea(.all)
                .cornerRadius(5)
            
            
            VStack(spacing: 0) {
                // Thumb Image
                Image(myWishlist.thumbUrl ?? "")
                    .resizable()
                    .frame(maxWidth: .infinity)
                    .frame(height: 171/852 * DeviceInfos().deviceHeight)
                    .cornerRadius(5)
                
                HStack(alignment: .center) {
                    VStack(alignment: .leading, spacing: 4/852 * DeviceInfos().deviceHeight) {
                        // Show Title
                        Text("\(myWishlist.showTitle ?? "")".uppercased())
                            .font(.custom(FontManager.Poppins.medium, size: 10))
                        
                        // Progress bar
                        ProgressView(progressPercentasge: myWishlist.watchedDuration ?? 0.0)
                        
                        // Total Duration
                        Text(myWishlist.showDuration ?? "")
                            .font(.custom(FontManager.Montserrat.medium, size: 7))
                            .padding(.top, -5)
                    }
                    
                    // Play Button
                    Button {
                        
                    } label: {
                        Image("redPlay")
                            .resizable()
                            .frame(width: 20.66/392 * DeviceInfos().deviceWidth, height: 20.66/392 * DeviceInfos().deviceWidth)
                    }
                    
                }
                .padding([.horizontal, .vertical], 7/852 * DeviceInfos().deviceHeight)
                .foregroundColor(Color.white)
            }
        }
        .cornerRadius(5)
    }
}

// MARK: - Properties
struct MyWatchlistItemView_Previews: PreviewProvider {
    static var previews: some View {
        MyWatchlistItemView(myWishlist: MyWishlist(showTitle: "", thumbUrl: "", watchedDuration: 0.0, showDuration: ""))
    }
}
