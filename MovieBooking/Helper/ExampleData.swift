//
//  ExampleData.swift
//  MovieBooking
//
//  Created by Hieu Le on 2/14/24.
//

import Foundation

enum ExampleData {
    static let movie = Movie(posterPath: "/i6yYcZ5sGHHM2l6dIgt2nZov7Hh.jpg",
                             backdropPath: "/rx6FXL5Pu2FQC3HrowNQrdqojnM.jpg",
                             id: 634492,
                             title: "Madame Web",
                             voteAverage: 5.6)
    
    static let theater = Theater(name: "Galaxy Nguyen Du", address: "Nguyen Du, Q.1, TP.HCM", hotline: "11111111", imageName: "nguyen_du")
}
