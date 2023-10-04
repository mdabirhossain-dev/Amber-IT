//
//  Country.swift
//  Amber IT Profile
//
//  Created by Md Abir Hossain on 2/10/23.
//

import Foundation



func countryNames() -> [String] {
    let country_list = ["Afghanistan","Albania","Algeria","Andorra","Angola","Anguilla","Antigua &amp; Barbuda","Argentina","Armenia","Aruba","Australia","Bangladesh","Barbados","Belarus","Belgium","Belize","Benin","Bermuda","Bhutan","Bolivia","Bosnia &amp; Herzegovina","Botswana","Brazil","British Virgin Islands","Brunei","Bulgaria","Burkina Faso","Burundi","Cambodia","Cameroon","Cape Verde","Cayman Islands","Djibouti","Dominica","Dominican Republic","Ecuador","Egypt","El Salvador","Equatorial Guinea","Estonia","Ethiopia","Falkland Islands","Faroe Islands","Iceland","India","Indonesia","Iran","Iraq","Ireland","Isle of Man","Latvia","Lebanon","Lesotho","Liberia","Libya","Liechtenstein","Niger","Nigeria","Norway","Oman","Pakistan","Palestine","Panama","Papua New Guinea","Tonga","Trinidad &amp; Tobago","Tunisia","Turkey","Turkmenistan","Turks &amp; Caicos","Uganda","Ukraine","United Arab Emirates","United Kingdom","Uruguay","Uzbekistan","Venezuela","Vietnam","Virgin Islands (US)","Yemen","Zambia","Zimbabwe"]
    return country_list
}

func countryFlag(countryName: String) -> String {
    let countryWithFlag = ["Bangladesh": "BangladeshFlag",
                           "Australia" : "AustraliaFlag",
                           "India": "IndiaFlag"]
    
    if let flag  = countryWithFlag[countryName] {
        return flag
    }
    return ""
}

func cityNames(countryName: String) -> [String] {
    let cityName = ["Bangladesh" : ["Dhaka", "Khulna", "Rajsahi", "Chittagong", "Rangpur", "Jhenaidah","Pabna"],
                    "India" : ["Kannada", "Tailnadu", "Delhi", "Chennai", "Dhamrai", "Mumbai","Kolkata"]]
    
    if let city = cityName[countryName] {
        return city
    }
    
    return [""]
}
func areaNames(city: String) -> [String] {
    print(city)
    let areaName = ["Dhaka" : ["Uttara","Gulshan", "Banani", "Mohakhali", "Dhanmondi","Mirpur"],
                    "Jhenaidah" : ["Shailkupa","Horinakundu","Moheshpur"],
                    "Khulna" : ["Bheramara","Imanpur","Horinarayanpur", "Khoksa"],
                    "Rangpur" : ["Mithapukur","Kaunia","Gangachara", "Rangpur Sadar", "Pirgacha", "Pirganj", "Taraganj"],
                    "Pabna" : ["Ishwordi","Ruppur","Pakshy"]]
    
    if let area = areaName[city] {
        return area
    }
    
    return [""]
}
