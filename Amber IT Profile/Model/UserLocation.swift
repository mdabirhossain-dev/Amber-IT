//
//  GeoLocations.swift
//  Amber IT Profile
//
//  Created by Md Abir Hossain on 2/10/23.
//

import Foundation

// MARK: - Welcome
struct GeoLocations: Codable {
    var data: [CountryName]?
}

// MARK: - Datum
struct CountryName: Codable, Identifiable {
    var id = UUID()
    var countryName: String?
    var city: [CityName]?
}

// MARK: - City
struct CityName: Codable, Identifiable {
    var id = UUID()
    var cityName: String?
    var area: [String]?
}
