//
//  Images.swift
//  MovieBooking
//
//  Created by Hieu Le on 2/15/24.
//

import Foundation

struct Images: Codable, Identifiable, Hashable {
    var id = UUID()
    var filePath: String?
    
    enum CodingKeys: String, CodingKey {
        case filePath = "file_path"
    }
}
