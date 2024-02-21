//
//  User.swift
//  MovieBooking
//
//  Created by Hieu Le on 2/20/24.
//

import Foundation

struct User: Codable, Identifiable {
    var id = UUID()
    var username: String
    var password: String
    
}
