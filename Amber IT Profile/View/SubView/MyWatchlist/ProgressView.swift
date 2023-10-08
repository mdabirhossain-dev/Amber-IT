//
//  ProgressView.swift
//  Amber IT Profile
//
//  Created by Md Abir Hossain on 8/10/23.
//

import SwiftUI

struct ProgressView: View {
    // MARK: - Properties
    let progressPercentasge: Double
    
    
    // MARK: - Body
    var body: some View {
        GeometryReader { geo in
            ZStack(alignment: .leading) {
                Rectangle()
                    .fill(Color.white.opacity(0.4))
                    .frame(width: geo.size.width, height: 6/852 * geo.size.width)
                
                Rectangle()
                    .fill(Color.hotRed)
                    .frame(width: progressPercentasge * geo.size.width, height: 8/geo.size.height)
            }
        }
    }
}

    // MARK: - Preview
struct ProgressView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressView(progressPercentasge: 0.5)
    }
}
