//
//  PaymentHistory.swift
//  Amber IT Profile
//
//  Created by Md Abir Hossain on 3/10/23.
//

import Foundation

struct PaymentHistory {
    let id = UUID()
    let packageName: String?
    let paidAmount: Double?
    let paymentMethod: String?
    let paymentDate: String?
}


let paymentHistory: [PaymentHistory] = [
    PaymentHistory(packageName: "Minor", paidAmount: 500.00, paymentMethod: "BKash", paymentDate: "2023-05-09"), PaymentHistory(packageName: "Junior", paidAmount: 650.00, paymentMethod: "Nagad", paymentDate: "2023-06-09")
]
