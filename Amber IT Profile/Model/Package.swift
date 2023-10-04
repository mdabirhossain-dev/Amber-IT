//
//  Package.swift
//  Amber IT
//
//  Created by Md Abir Hossain on 21-09-2023.
//

import Foundation


struct Package: Identifiable {
    let id = UUID()
    let packageName: String?
    let packageBndwidth: String?
    let useTime: String?
    let connectionType: String?
    let talkTime: String?
    let otcCharge: Double?
    let monthlyBill: Double?
    let isCustomerService: Bool?
}

let packageList: [Package] = [
Package(packageName: "MINOR", packageBndwidth: "8 Mbps", useTime: "24 Hours Unlimited", connectionType: "Fiber Optics", talkTime: "200 min", otcCharge: 3000, monthlyBill: 500, isCustomerService: true), Package(packageName: "JUNIOR", packageBndwidth: "10 Mbps", useTime: "", connectionType: "Fiber Optics", talkTime: "N/A", otcCharge: 3000, monthlyBill: 650, isCustomerService: false), Package(packageName: "BASIC", packageBndwidth: "15 Mbps", useTime: "24 Hours Unlimited", connectionType: "Fiber Optics", talkTime: "N/A", otcCharge: 3000, monthlyBill: 800, isCustomerService: true), Package(packageName: "LEARNER", packageBndwidth: "20 Mbps", useTime: "", connectionType: "Fiber Optics", talkTime: "500 min", otcCharge: 3000, monthlyBill: 1000, isCustomerService: false)
]
