//
//  MovieDetailViewModel.swift
//  MovieBooking
//
//  Created by Hieu Le on 2/15/24.
//

import Foundation

class MovieDetailViewModel: ObservableObject {
    @Published var movie: MovieDetail?
    private lazy var apiService = APIService()
    
    func getMovieDetail(id: Int) {
        apiService.getMovieDetail(id: id) { [weak self] movie in
            self?.movie = movie
        }
    }
}
