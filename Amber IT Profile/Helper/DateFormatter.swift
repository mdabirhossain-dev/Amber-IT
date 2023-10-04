//
//  DateFormatter.swift
//  Amber IT Profile
//
//  Created by Md Abir Hossain on 1/10/23.
//

import Foundation


func dateFormatter(date: Date) -> String  {
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd/MM/yyyy"
    let dateString = dateFormatter.string(from: date)
    
    return "\(dateString)"
}
