//
//  NavigationBar.swift
//  Amber IT Profile
//
//  Created by Md Abir Hossain on 27/9/23.
//

import SwiftUI

struct NavigationBar<Content: View>: View {
    // MARK: - Properties
    
    let content: Content
//    @Binding var gotoNotificationView: Bool // Commented due to ifficiency doubt
    init(@ViewBuilder content: () -> Content) {
            self.content = content()
//            self._gotoNotificationView = gotoNotificationView // Commented due to ifficiency doubt
        }
    
    @Environment(\.presentationMode) var presentation
    
    // MARK: - Body
    var body: some View {
        HStack(spacing: 21) {
            
            HStack(spacing: 8) {
                content
            }
            
            Spacer()
            
            //   Something------>
            Button {
                presentation.wrappedValue.dismiss()
            } label: {
                Image("screenCast")
            }
            
            // Search
            Button {
                presentation.wrappedValue.dismiss()
            } label: {
                Image(systemName: "magnifyingglass")
            }
            
            // Notification
            NavigationLink(destination: NotificationsView()) {
                Image("bell")
                    .frame(width: 20.64, height: 22.97)
            }
        }
        .padding(.horizontal, 16)
        .foregroundColor(Color.white)
        .frame(maxWidth: .infinity, maxHeight: 40, alignment: .center)
        .background(Color.clear.blur(radius: 10))
    }
}

// MARK: - Preview
struct NavigationBar_Previews: PreviewProvider {
    static var previews: some View {
        NavigationBar(content: {
            Text("Hello Nav")
        })
    }
}
