//
//  AllMovieView.swift
//  MovieBooking
//
//  Created by Hieu Le on 2/14/24.
//

import SwiftUI

struct AllMovieView: View {
    @ObservedObject var viewModel: MoviesListViewModel
    
    enum Status {
        case nowPlaying
        case upcoming
    }
    
    @State var status: Status = .nowPlaying
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                HStack {
                    Button {
                        status = .nowPlaying
                    } label: {
                        Text("Now playing")
                            .font(.system(size: 20))
                            .foregroundColor(status == .nowPlaying ? .blue : .gray)
                    }
                    
                    Divider()
                    
                    Button {
                        status = .upcoming
                    } label: {
                        Text("Upcoming")
                            .font(.system(size: 20))
                            .foregroundColor(status == .upcoming ? .blue : .gray)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                switch status {
                case .nowPlaying:
                    MoviesListView(movies: viewModel.nowPlayingMovies, numItem: viewModel.nowPlayingMovies.count)
                case .upcoming:
                    MoviesListView(movies: viewModel.upcomingMovies, numItem: viewModel.upcomingMovies.count)
                }
            }
        }
        .padding(.horizontal)
        .navigationTitle("Movie")
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct AllMovieView_Previews: PreviewProvider {
    static var previews: some View {
        AllMovieView(viewModel: MoviesListViewModel())
    }
}
