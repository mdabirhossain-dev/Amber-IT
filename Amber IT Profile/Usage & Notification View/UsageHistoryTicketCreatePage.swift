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
            TextField("Enter Customer ID Here", text: $customerID)
            .UseageHistoryTextFieldDesign(RectangeHeight: 57.7)
                
            TextFieldTitleAtUsageHistory(text: "Subject")
            TextField("Enter your subject Here", text: $ticketSubject)
                .UseageHistoryTextFieldDesign(RectangeHeight: 57.7)
            
            TextFieldTitleAtUsageHistory(text: "Message")
            TextField("Enter Max 250 Charecter", text: $messageData)
                .frame(height: 98.8)
                .UseageHistoryTextFieldDesign(RectangeHeight: 98.8)
            
        }
    }
}

struct UsageHistoryTicketCreatePage_Previews: PreviewProvider {
    static var previews: some View {
        UsageHistoryTicketCreatePage()
    }
}
