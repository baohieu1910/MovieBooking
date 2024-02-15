//
//  Cast.swift
//  MovieBooking
//
//  Created by Hieu Le on 2/15/24.
//

import Foundation

struct Cast: Codable, Identifiable, Hashable {
    var id: Int
    var name: String?
    var profilePath: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case profilePath = "profile_path"
    }
}
