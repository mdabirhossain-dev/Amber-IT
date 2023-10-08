//
//  PackageListView.swift
//  Amber IT Profile
//
//  Created by Md Abir Hossain on 3/10/23.
//

import SwiftUI

struct PackageListView: View {
    // MARK: - Properties
    
    // Go to PackageForm
    @Binding var isForm: Bool
    
    
    // MARK: - Body
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 12) {
                ForEach(0..<packageList.count, id: \.self) { index in
                    PackageCardView(package: packageList[index], isForm: $isForm)
                }
            }
        }
    }
}

// MARK: - Preview
struct PackageListView_Previews: PreviewProvider {
    @State static var isForm: Bool = false
    static var previews: some View {
        PackageListView(isForm: $isForm)
    }
}
