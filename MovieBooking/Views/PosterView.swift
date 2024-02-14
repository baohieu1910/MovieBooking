//
//  PosterView.swift
//  MovieBooking
//
//  Created by Hieu Le on 2/14/24.
//

import SwiftUI

struct PosterView: View {
    let movie: Movie
    
    let imageWidth = UIScreen.screenWidth / 2 - 30
    var body: some View {
        let url = URL(string: Utils.getMoviePoster(posterPath: movie.posterPath))
        AsyncImage(url: url) { image in
            VStack(alignment: .leading) {
                ZStack(alignment: .bottomTrailing) {
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: imageWidth, height: imageWidth * 3 / 2)
                        .clipped()
                        .cornerRadius(5)
                    
                    ZStack {
                        HStack {
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                            
                            Text("\(movie.voteAverage ?? 0.0, specifier: "%.1f")")
                                .foregroundColor(.white)
                                
                        }
                        .font(.system(size: 12))
                        .padding(5)
                        .background(.black.opacity(0.5))
                        .padding(.vertical, 10)
                        
                    }
                }
                
                Text("\(movie.title ?? "N/A")")
            }
            
        } placeholder: {
            ProgressView()
                .frame(width: imageWidth, height: imageWidth * 3 / 2 + 15)
        }
    }
}

struct PosterView_Previews: PreviewProvider {
    static var previews: some View {
        PosterView(movie: ExampleData.movie)
    }
}
