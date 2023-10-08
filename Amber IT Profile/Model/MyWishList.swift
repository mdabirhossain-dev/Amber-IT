//
//  MyWishList.swift
//  Amber IT Profile
//
//  Created by Md Abir Hossain on 8/10/23.
//

import Foundation


struct MyWishlist {
    let id = UUID()
    let showTitle: String?
    let thumbUrl: String?
    let watchedDuration: Double?
    let showDuration: String?
}


let myWatchlist: [MyWishlist] = [
    MyWishlist(showTitle: "Maya Shalik", thumbUrl: "watchlist01", watchedDuration: 0.3, showDuration: "2h 17m remaining"),
    MyWishlist(showTitle: "Judas", thumbUrl: "watchlist02", watchedDuration: 0.5, showDuration: "1h 17m remaining"),
    MyWishlist(showTitle: "The Silence", thumbUrl: "watchlist03", watchedDuration: 0.2, showDuration: "17m remaining"),
    MyWishlist(showTitle: "Infinity", thumbUrl: "watchlist04", watchedDuration: 0.8, showDuration: "50m remaining"),
    MyWishlist(showTitle: "Friday", thumbUrl: "watchlist05", watchedDuration: 0.4, showDuration: "2h 34m remaining"),
    MyWishlist(showTitle: "Sholey", thumbUrl: "watchlist06", watchedDuration: 0.6, showDuration: "1h 20m remaining")
]
