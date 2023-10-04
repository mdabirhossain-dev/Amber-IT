//
//  UsageHistoryTicketCreatePage.swift
//  Amber IT Profile
//
//  Created by Tanvir Rahman on 4/10/23.
//

import SwiftUI

struct UsageHistoryTicketCreatePage: View {
    @State private var customerID: String = ""
    @State private var ticketSubject: String = ""
    @State private var messageData: String = ""
    var body: some View {
        
        VStack{
            TextFieldTitleAtUsageHistory(text: "Customer ID")
                .padding(.vertical, 10)
            TextField("Enter Customer ID Here", text: $customerID)
            .UseageHistoryTextFieldDesign(RectangeHeight: 57.7)
                
            TextFieldTitleAtUsageHistory(text: "Subject")
                .padding(.vertical, 10)
            TextField("Enter your subject Here", text: $ticketSubject)
                .UseageHistoryTextFieldDesign(RectangeHeight: 57.7)
            
            
            TextFieldTitleAtUsageHistory(text: "Message")
                .padding(.top, 10)
            
            ZStack(alignment: .leading) {
                if messageData.isEmpty {
                    VStack {
                        Text("Enter Max 250 Charecter")
                            .padding(.top, 10)
                            .padding(.leading, 27)
                            .opacity(0.7)
                        Spacer()
                    }
                }
                VStack {
                    TextEditor(text: $messageData)
                        .frame(height: 98)
                        .UseageHistoryTextFieldDesign(RectangeHeight: 98.8)
                        .opacity(messageData.isEmpty ? 0.85 : 1)
                    Spacer()
                }
            }.frame(height: 99.0)
            HStack{
                Button{
                    
                }label: {
                    Text("Choose File")
                        .font(.custom(FontManager.Poppins.semiBold, size: 14))
                        .padding(12)
                        .foregroundColor(Color.white)
                        .background(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.white, style: StrokeStyle(lineWidth: 1.5, dash: [3, 3]))
                        )

                }
            Spacer()
            }.padding(.horizontal)
        }
    }
}

struct UsageHistoryTicketCreatePage_Previews: PreviewProvider {
    static var previews: some View {
        UsageHistoryTicketCreatePage()
    }
}
