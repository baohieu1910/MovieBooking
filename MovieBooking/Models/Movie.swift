//
//  Movie.swift
//  MovieBooking
//
//  Created by Hieu Le on 2/14/24.
//

import Foundation

struct Movie: Codable, Identifiable, Hashable {
    var posterPath: String?
    var backdropPath: String?
    var releaseDate: String?
    var id: Int
    var title: String?
    var voteAverage: Double?
    
    enum CodingKeys: String, CodingKey {
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
        case releaseDate = "release_date"
        case id
        case title
        case voteAverage = "vote_average"
    }
}
