//
//  TheaterView.swift
//  MovieBooking
//
//  Created by Hieu Le on 2/17/24.
//

import SwiftUI

struct TheaterView: View {
    @ObservedObject var viewModel = MoviesListViewModel()
    let theater: Theater
    
    var body: some View {
        
        ScrollView(showsIndicators: false) {
            VStack {
                HStack {
                    Image(systemName: "location")
                    
                    Text("\(theater.address)")
                    
                }
                .foregroundColor(.gray)
                
                Divider()
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(1..<7) { date in
                            Text("Date \(date)")
                            
                        }
                    }
                }
                
                ForEach(viewModel.nowPlayingMovies) { movie in
                    HStack {
                        let url = URL(string: Utils.getMoviePoster(posterPath: movie.posterPath))
                        AsyncImage(url: url) { image in
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(width: UIScreen.screenWidth / 6)
                                .cornerRadius(5)
                            
                        } placeholder: {
                            ProgressView()
                                .frame(width: UIScreen.screenWidth / 6, height: UIScreen.screenWidth * 3 / 12 )
                        }
                        
                        VStack(alignment: .leading) {
                            Text("\(movie.title ?? "N/A")")
                            
                            HStack {
                                Image(systemName: "calendar")
                                    .foregroundColor(.orange)
                                
                                Text("\(Utils.getReleaseDate(releaseDate: movie.releaseDate))")
                                    .foregroundColor(.gray)
                            }
                            
                            HStack {
                                Image(systemName: "star.fill")
                                    .foregroundColor(.yellow)
                                
                                Text("\(movie.voteAverage ?? 0, specifier: "%.1f")")
                                
                            }
                        }
                        .frame(maxWidth: .infinity, alignment: .leading)
                    }
                }
            }
        }
        .padding(.horizontal)
        .navigationTitle("\(theater.name)")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            viewModel.getNowPlayingMovies()
        }
        
    }
}

struct TheaterView_Previews: PreviewProvider {
    static var previews: some View {
        TheaterView(theater: ExampleData.theater)
    }
}
