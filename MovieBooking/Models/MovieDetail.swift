//
//  MovieDetail.swift
//  MovieBooking
//
//  Created by Hieu Le on 2/14/24.
//

import Foundation

struct MovieDetail: Codable, Identifiable, Hashable {
    var backdropPath: String?
    var id: Int
    var overview: String?
    var posterPath: String?
    var releaseDate: String?
    var runtime: Int?
    var title: String?
    var voteAverage: Double?
    
    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case id
        case overview
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case runtime
        case title
        case voteAverage = "vote_average"
    }
}

