//
//  PaymentHistoryListView.swift
//  Amber IT Profile
//
//  Created by Md Abir Hossain on 3/10/23.
//

import SwiftUI

struct PaymentHistoryListView: View {
    // MARK: - Properties
    
    
    // MARK: - Body
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 12) {
                ForEach(0..<paymentHistory.count, id: \.self) { index in
                    PaymentHistoryListItemView(payment: paymentHistory[index])
                }
            }
        }
    }
}

// MARK: - Preview
struct PaymentHistoryListView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentHistoryListView()
    }
}
