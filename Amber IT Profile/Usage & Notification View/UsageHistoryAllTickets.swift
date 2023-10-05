//
//  UsageHistoryAllTickets.swift
//  Amber IT Profile
//
//  Created by Tanvir Rahman on 4/10/23.
//

import SwiftUI

struct UsageHistoryAllTickets: View {
    @State private var isPendinig: Bool = true
    var body: some View {
        ScrollView {
            ForEach(0..<15) { i in
                RoundedRectangle(cornerRadius: 10)
                    .frame(height: 99.11905)
                    .foregroundColor(.white)
                    .overlay (
                        VStack(alignment: .leading){
                            HStack(alignment: .top){
//                                if !isPendinig {
                                if i % 3 == 0 {
                                    ZStack(alignment: .center){
                                        RoundedRectangle(cornerRadius: 10)
                                            .foregroundColor(.white)
                                            .shadow(color: .black.opacity(0.25), radius: 2, x: 0, y: 4)
                                            .frame(width: 39.86309, height: 42.01786)
                                        Circle()
                                            .foregroundColor(.black)
                                            .frame(width: 8.61905, height: 8.61905)
                                        Circle()
                                            .stroke(Color.black, lineWidth: 2)
                                            .frame(width: 15.08333, height: 15.08333)
                                        
                                    }
                                    
                                }else {
                                    ZStack(alignment: .center){
                                        Image("rectangleEllipse")
                                            .resizable()
                                            .frame(width: 39.86309, height: 42.01786)
                                        Image("Ellipse")
                                            .resizable()
                                            .frame(width: 16.16072, height: 15.08333)
                                        
                                    }
                                }
                                VStack(alignment: .leading, spacing: 5){
                                    HStack{
                                        Text("Ticket #2145")
                                            .foregroundColor(.black)
                                            .font(.custom(FontManager.Poppins.medium, size: 12))
                                        Text("October 05, 2023 | 5.00 PM")
                                            .foregroundColor(.gray.opacity(0.5))
                                            .font(.custom(FontManager.Poppins.medium, size: 12))
                                    }.lineLimit(1)
                                        .minimumScaleFactor(0.5)
                                    Text("Content Buffering")
                                        .foregroundColor(.gray.opacity(0.5))
                                        .font(.custom(FontManager.Poppins.medium, size: 12))
                                    
                                }
                                Spacer()
//                                if !isPendinig {
                                if i % 3 == 0 {
                                    Text("Pending")
                                        .font(.custom(FontManager.Poppins.medium, size: 11))
                                        .foregroundColor(.black)
                                        .padding(5)
                                        .background(Color(red: 0.85, green: 0.85, blue: 0.85))
                                        .cornerRadius(7)
                                        .padding(.trailing, 5)
                                }else{
                                    Text("Done")
                                        .font(.custom(FontManager.Poppins.medium, size: 11))
                                        .foregroundColor(.white)
                                        .padding(5)
                                        .background(Color(red: 0, green: 0.92, blue: 0.48))
                                        .cornerRadius(7)
                                        .padding(.trailing, 5)
                                }
                            }
                            HStack{
                                Text("Complete before :")
                                    .foregroundColor(.black)
                                    .font(.custom(FontManager.Poppins.medium, size: 12))
                                Text("October 05, 2023 | 5.00 PM")
                                    .foregroundColor(.gray.opacity(0.5))
                                    .font(.custom(FontManager.Poppins.medium, size: 12))
                                Spacer(minLength: 5)
                            }.lineLimit(1)
                                .minimumScaleFactor(0.5)

                        }.padding(5)
                    )
                    .padding(.horizontal, 10)
                    .padding(.vertical, 2)
            }
            
        }
    }
}

struct UsageHistoryAllTickets_Previews: PreviewProvider {
    static var previews: some View {
        UsageHistoryAllTickets()
    }
}
