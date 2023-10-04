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
            TextEditor(text: $messageData)
                .frame(height: 98)
                .UseageHistoryTextFieldDesign(RectangeHeight: 98.8)
            
        }
    }
}

struct UsageHistoryTicketCreatePage_Previews: PreviewProvider {
    static var previews: some View {
        UsageHistoryTicketCreatePage()
    }
}
