//
//  ImagesListViewModel.swift
//  MovieBooking
//
//  Created by Hieu Le on 2/15/24.
//

import Foundation

class ImageListsViewModel: ObservableObject {
    @Published var images: [Images] = []
    private lazy var apiService = APIService()
    
    func getImagesList(id: Int) {
        apiService.getMovieImages(id: id) { [weak self] images in
            self?.images = images
        }
    }
}
