//
//  MyWishlistView.swift
//  Amber IT Profile
//
//  Created by Md Abir Hossain on 8/10/23.
//

import SwiftUI


// Swearch Colums
let columns = [
        GridItem(),
        GridItem(),
        GridItem()
]

struct MyWishlistView: View {
    // MARK: - Properties
    // Dismiss view
    @Environment(\.presentationMode) var presentation
        
    
    // MARK: - Body
    var body: some View {
        VStack {
            // NavigationBar
            NavigationBar(content: {
                HStack(spacing: 11) {
                    Button {
                        // Dismissing from this view
                        presentation.wrappedValue.dismiss()
                    } label: {
                        Image("arrow-left")
                            .resizable()
                            .frame(width: 24, height: 24)
                            .foregroundColor(Color.white)
                    }
                    
                    Text("My watchList")
                        .font(.custom(FontManager.Poppins.semiBold, size: 18))
                }
            })
            
            ScrollView(.vertical, showsIndicators: false) {
                LazyVGrid(columns: columns, spacing: 21) {
                    ForEach(0 ..< myWatchlist.count, id: \.self) { index in
                        MyWatchlistItemView(myWishlist: myWatchlist[index])
                    }
                }
            }
            .padding(.horizontal, 18)
        }
        .navigationBarBackButtonHidden(true)
    }
}

// MARK: - Preview
struct MyWishlistView_Previews: PreviewProvider {
    static var previews: some View {
        MyWishlistView()
    }
}
