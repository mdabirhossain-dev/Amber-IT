//
//  StepGradientView.swift
//  Amber IT
//
//  Created by Md Abir Hossain on 21-09-2023.
//

import SwiftUI

struct StepGradientView: View {
    
    var body: some View {
        HStack(spacing: 0) {
            Rectangle()
                .fill(Color(UIColor(red: 0.7, green: 0, blue: 0, alpha: 1)))
            Rectangle()
                .fill(Color.red)
            Rectangle()
                .fill(Color.white.opacity(0.5))
            Rectangle()
                .fill(Color.white.opacity(0.8))
        }
        .background(Color.red)
    }
}

struct StepGradientView_Previews: PreviewProvider {
    static var previews: some View {
        StepGradientView()
    }
}
