//
//  PackageListView.swift
//  Amber IT Profile
//
//  Created by Md Abir Hossain on 3/10/23.
//

import SwiftUI

struct PackageListView: View {
    // MARK: - Properties
    
    
    // MARK: - Body
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack(spacing: 12) {
                ForEach(0..<packageList.count, id: \.self) { index in
                    PackageCardView(package: packageList[index])
                }
            }
        }
    }
}

// MARK: - Preview
struct PackageListView_Previews: PreviewProvider {
    static var previews: some View {
        PackageListView()
    }
}
