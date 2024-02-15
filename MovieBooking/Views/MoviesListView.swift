//
//  MoviesListView.swift
//  MovieBooking
//
//  Created by Hieu Le on 2/14/24.
//

import SwiftUI

struct MoviesListView: View {
    let movies: [Movie]
    let numItem: Int
    
    let columns = [
        GridItem(),
        GridItem()
    ]
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVGrid(columns: columns) {
                ForEach(movies.prefix(numItem)) { movie in
                    PosterView(movie: movie)
                        .padding(.bottom)
                }
            }
        }
    }
}

struct MoviesListView_Previews: PreviewProvider {
    static var previews: some View {
        MoviesListView(movies: [], numItem: 6)
    }
}
