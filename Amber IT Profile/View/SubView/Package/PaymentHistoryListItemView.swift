//
//  PaymentHistoryListItemView.swift
//  Amber IT Profile
//
//  Created by Md Abir Hossain on 3/10/23.
//

import SwiftUI

struct PaymentHistoryListItemView: View {
    // MARK: - Properties
    
    let payment: PaymentHistory
        
    
    // MARK: - Body
    var body: some View {
        VStack(spacing: 10) {
            HStack {
                // Package Name
                Text("\(payment.packageName ?? "") Packages Subscription")
                    .foregroundColor(Color.hotRed)
                
                Spacer()
                
                // Paid Amount
                Text("BDT \(payment.paidAmount ?? 0.0, specifier: "%0.2f")")
            }
            
            HStack {
                // Payment Method
                Text("\(payment.paymentMethod ?? "")")
                
                Spacer()
                
                // Payment Date
                Text(payment.paymentDate ?? "")
            }
        }
        .padding(15)
        .font(.custom(FontManager.Poppins.medium, size: 12))
        .frame(height: 53/852 * DeviceInfos().deviceHeight)
        .frame(maxWidth: .infinity)
        .background(
            LinearGradient(gradient: gradientGray, startPoint: .top, endPoint: .bottom)
        )
    }
}

// MARK: - Preview
struct PaymentHistoryListItemView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentHistoryListItemView(payment: paymentHistory[0])
    }
}
