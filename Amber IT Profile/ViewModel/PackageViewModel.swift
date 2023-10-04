//
//  PackageViewModel.swift
//  Amber IT Profile
//
//  Created by Md Abir Hossain on 3/10/23.
//

import Foundation


class PackageViewModel: ObservableObject {
    
    static let shared = PackageViewModel()
    
    @Published var package: [PackageViewModel]?
}
