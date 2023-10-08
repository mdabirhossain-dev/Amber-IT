//
//  UsageHistorySupportPage.swift
//  Amber IT Profile
//
//  Created by Tanvir Rahman on 5/10/23.
//

import SwiftUI

struct UsageHistorySupportPage: View {
    @State private var ticketCreate: Bool = true
    @State private var allTicket: Bool = false
    @State private var feedback: Bool = false
    @State private var gotoNotificationView: Bool = false
    var body: some View {
        VStack{
            // NavigationBar
            NavigationBar(content: {
                Image("amberLogo")
                    .frame(width: 21, height: 33)
            })
            
            RoundedRectangle(cornerRadius: 10)
                .frame(height: 36)
                .padding(.horizontal, 10)
                .foregroundColor(Color(red: 0.85, green: 0.85, blue: 0.85))
                .overlay(
                    HStack{
                        Text("Ticket Create")
                            .font(.custom(FontManager.Poppins.bold, size: 12))
                            .foregroundColor(ticketCreate ? .white : .black)
                            .padding(5)
                            .padding(.horizontal)
                            .background(
                                ticketCreate ?
                                Color(red: 0.88, green: 0.2, blue: 0.18)
                                //.cornerRadius(5) as! Color
                                
                                : Color(red: 0.85, green: 0.85, blue: 0.85)
                                
                            )
                            .cornerRadius(5)
                            .onTapGesture {
                                withAnimation {
                                    feedback = false
                                    allTicket = false
                                    ticketCreate = true
                                }
                            }
                        
                        
                        Spacer()
                        Text("All Ticket")
                            .font(.custom(FontManager.Poppins.bold, size: 12))
                            .foregroundColor(allTicket ? .white : .black)
                            .padding(5)
                            .padding(.horizontal)
                            .background(
                                allTicket ?
                                Color(red: 0.88, green: 0.2, blue: 0.18) : Color(red: 0.85, green: 0.85, blue: 0.85)
                                
                            ).cornerRadius(5)
                            .onTapGesture {
                                withAnimation {
                                    feedback = false
                                    allTicket = true
                                    ticketCreate = false
                                }
                            }
                        
                        
                        Spacer()
                        Text("Feedback")
                            .font(.custom(FontManager.Poppins.bold, size: 12))
                            .foregroundColor(feedback ? .white : .black)
                            .padding(5)
                            .padding(.horizontal)
                            .background( 
                                feedback ?
                                Color(red: 0.88, green: 0.2, blue: 0.18) : Color(red: 0.85, green: 0.85, blue: 0.85)
                                
                            ).cornerRadius(5)
                            .onTapGesture {
                                withAnimation {
                                    feedback = true
                                    allTicket = false
                                    ticketCreate = false
                                }
                            }
                    }.padding(.horizontal, 15)
                )
            ZStack {
                NavigationLink(destination: NotificationsView(), isActive: $gotoNotificationView) {
                    EmptyView()
                }
                if ticketCreate {
                    UsageHistoryTicketCreatePage()
                }
                if allTicket {
                    UsageHistoryAllTickets()
                        .padding(.top, 5)
                }
                if feedback {
                    FeedBackView()
                }
                
            }
            Spacer()
            
        }
        .edgesIgnoringSafeArea(.bottom)
        .navigationBarBackButtonHidden(true)
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
}

struct UsageHistorySupportPage_Previews: PreviewProvider {
    static var previews: some View {
        UsageHistorySupportPage()
    }
}
