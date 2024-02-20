//
//  MovieSliderView.swift
//  MovieBooking
//
//  Created by Hieu Le on 2/15/24.
//

import SwiftUI

struct MovieSliderView: View {
    var movies: [Movie]
    
    var body: some View {
        TabView {
            ForEach(movies) { movie in
                let url = URL(string: Utils.getMovieBackground(backdropPath: movie.backdropPath))
                AsyncImage(url: url) { image in
                    NavigationLink {
                        MovieDetailView(viewModel: MovieDetailViewModel(), movie: movie)
                    } label: {
                        image
                            .resizable()
                            .scaledToFill()
                    }
                } placeholder: {
                    ProgressView()
                }
            }
        }
        .tabViewStyle(PageTabViewStyle())
        //        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
    
    }
}

struct MovieSliderView_Previews: PreviewProvider {
    static var previews: some View {
        MovieSliderView(movies: [])
        
    }
}
