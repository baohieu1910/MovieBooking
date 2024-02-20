//
//  CastListViewModel.swift
//  MovieBooking
//
//  Created by Hieu Le on 2/15/24.
//

import Foundation

class CastListViewModel: ObservableObject {
    @Published var casts: [Cast] = []
    private lazy var apiService = APIService()
    
    
}

extension CastListViewModel {
    func getCastList(id: Int) {
        apiService.getMovieCastList(id: id) { [weak self] casts in
            self?.casts = casts
        }
    }
}

private extension CastListViewModel {
    
}
