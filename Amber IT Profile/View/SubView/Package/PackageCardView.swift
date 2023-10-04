//
//  PackageCardView.swift
//  Amber IT Profile
//
//  Created by Md Abir Hossain on 3/10/23.
//

import SwiftUI


struct PackageCardView: View {
    @StateObject var packages = PackageViewModel.shared
    let package: Package
    
    var body: some View {
        VStack {
//            GeometryReader { geo in
            VStack(alignment: .center, spacing: 20) {
                    
//                    let deviceWidth = geo.size.width
                    let deviceWidth = DeviceInfos().deviceWidth - 50
                    
                // Package Name
                    Text(package.packageName ?? "")
                        .font(.custom(FontManager.Poppins.medium, size: 32))
                        .foregroundColor(Color.white)
                        .frame(maxWidth: .infinity)
                        .padding(.vertical, 12)
                        .background(
                            LinearGradient(gradient: Gradient(colors: [Color(red: 0.92, green: 0.11, blue: 0.19), Color(red: 0.58, green: 0.05, blue: 0.05)]), startPoint: .top, endPoint: .bottom)
                        )
                    
                    
                    VStack(spacing: 20) {
                        // Package Bandwidth
                        Text(package.packageBndwidth ?? "")
                            .font(.custom(FontManager.Poppins.semiBold, size: 37))
                            .foregroundColor(Color.yellow)
                        
                        // Step Gradient
                        StepGradientView()
                            .frame(width: 84/392 * deviceWidth, height: 4/853 * DeviceInfos().deviceHeight)
                    }
                    
                    
                    VStack(alignment: .leading) {
                        // Used Talktime
                        if !(package.useTime?.isEmpty ?? true) {
                            Text("• 24 Hours Unlimited")
                                .foregroundColor(Color.white)
                        }
                        
                        // Connection type
                        if !(package.connectionType?.isEmpty ?? true) {
                            Text("• \(package.connectionType ?? "")")
                                .foregroundColor(Color.white)
                        }
                        
                        // Free Talktime
                        Text("• Talk time - \(package.talkTime ?? "N/A")")
                            .foregroundColor(Color.white)
                        
                        // OTC Charge
                        Text("• OTC Free - \(package.otcCharge ?? .zero, specifier: "%.2f") Taka")
                            .foregroundColor(Color.white)
                        
                        // Customer Support Type
                        if package.isCustomerService ?? false {
                            Text("• 24/7 Customer Care")
                                .foregroundColor(Color.white)
                        }
                    }
                    .font(.custom(FontManager.Poppins.medium, size: 18))
                
                // Monthly Bill
                Text("৳ \(package.monthlyBill ?? 0.0, specifier: "%.2f")")
                    .font(.custom(FontManager.Poppins.bold, size: 35))
                    .foregroundColor(Color.white) +
                
                Text("/")
                    .font(.custom(FontManager.Poppins.bold, size: 17))
                    .foregroundColor(Color.gray) +
                
                Text("MONTH")
                    .font(.system(size: 10, weight: .medium))
                    .foregroundColor(Color(UIColor(red: 0.61, green: 0.61, blue: 0.61, alpha: 1)))
                
                
                // Registration button
                Button {
                    
                } label: {
                    Text("+ GET ONLINE REGISTER")
                        .font(.custom(FontManager.Poppins.semiBold, size: 21))
                        .foregroundColor(Color.white)
                        .frame(maxWidth: .infinity)
                        .frame(height: 45/852 * DeviceInfos().deviceHeight)
                        .background(
                            LinearGradient(gradient: Gradient(colors: [Color(red: 1, green: 0.01, blue: 0.33), Color(red: 0.96, green: 0.53, blue: 0.12)]), startPoint: .leading, endPoint: .trailing)
                                .cornerRadius(14)
                        )
                }
                .padding(.horizontal, 23)
            }
            .frame(maxWidth: .infinity)
            .padding(.bottom, 23)
            .background(
                LinearGradient(gradient: Gradient(colors: [Color(red: 0.92, green: 0.11, blue: 0.19), .black.opacity(0.5)]), startPoint: .top, endPoint: .bottom)
                    .ignoresSafeArea(.all)
            )
            .cornerRadius(5)
            .overlay(
                RoundedRectangle(cornerRadius: 5)
                    .stroke(
                        LinearGradient(
                            colors: [Color(red: 0.92, green: 0.11, blue: 0.19), .white],
                            startPoint: .top,
                            endPoint: .bottom)
                        , lineWidth: 2)
            )
            .cornerRadius(5)
            
//          }
        }
    }
}
// MARK: - Preview
//struct PackageCardView_Previews: PreviewProvider {
//    @State var package = Package(packageName: "", packageBndwidth: "", useTime: "", connectionType: "", talkTime: "", otcCharge: 0.0, monthlyBill: 0.0, isCustomerService: false)
//    static var previews: some View {
//        PackageCardView(package: package)
//    }
//}
