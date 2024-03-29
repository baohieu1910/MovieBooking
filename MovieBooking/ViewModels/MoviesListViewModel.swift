//
//  MoviesListViewModel.swift
//  MovieBooking
//
//  Created by Hieu Le on 2/14/24.
//

import Foundation

class MoviesListViewModel: ObservableObject {
    @Published var nowPlayingMovies: [Movie] = []
    @Published var upcomingMovies: [Movie] = []
    
    private lazy var apiService = APIService()
    

}

extension MoviesListViewModel {
    func getNowPlayingMovies() {
        apiService.getNowPlayingMovies(page: 1) { [weak self] movies in
            self?.nowPlayingMovies = movies
        }
    }
    
    func getUpcomingMovies() {
        apiService.getUpcomingMovie(page: 1) { [weak self] movies in
            self?.upcomingMovies = movies
        }
    }
}

private extension MoviesListViewModel {
    
}
