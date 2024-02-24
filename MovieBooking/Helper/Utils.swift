//
//  Utils.swift
//  MovieBooking
//
//  Created by Hieu Le on 2/14/24.
//

import Foundation
import SwiftUI

enum Utils {
    static func getCastImage(profilePath: String?) -> String {
        guard let profilePath else {
            return Constants.noProfileImage
        }
        return Constants.baseImageUrl + Constants.largeImageSize + profilePath
    }

    static func getReleaseDate(releaseDate: String?) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        
        guard let releaseDate else {
            return "N/A"
        }
        if let dateToDisplay = dateFormatter.date(from: releaseDate) {
            dateFormatter.dateFormat = "MMMM dd, yyyy"
            return dateFormatter.string(from: dateToDisplay)
        }
        return "N/A"
    }
    
    static func getMovieBackground(backdropPath: String?) -> String {
        guard let backdropPath else {
            return Constants.noImageName
        }
        return Constants.baseImageUrl + Constants.backGroundImageSize + backdropPath
    }
    
    static func getMoviePoster(posterPath: String?) -> String {
        guard let posterPath else {
            return Constants.noImageName
        }
        return Constants.baseImageUrl + Constants.largeImageSize + posterPath
    }
    
    static func getMovieLogo(posterPath: String?) -> String {
        guard let posterPath else {
            return Constants.noImageName
        }
        return Constants.baseImageUrl + Constants.logoSize + posterPath
    }
    
    static func getImage(filePath: String?) -> String {
        guard let filePath else {
            return Constants.noImageName
        }
        return Constants.baseImageUrl + Constants.backGroundImageSize + filePath
    }
}


