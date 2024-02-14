//
//  HomeView.swift
//  MovieBooking
//
//  Created by Hieu Le on 2/14/24.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: MoviesListViewModel
    
    enum Status {
        case nowPlaying
        case upcoming
    }
    
    @State var status: Status = .nowPlaying
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack {
                    HStack {
                        Button {
                            status = .nowPlaying
                        } label: {
                            Text("Now playing")
                                .foregroundColor(status == .nowPlaying ? .blue : .gray)
                        }
                        
                        Divider()
                        
                        Button {
                            status = .upcoming
                        } label: {
                            Text("Upcoming")
                                .foregroundColor(status == .upcoming ? .blue : .gray)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    switch status {
                    case .nowPlaying:
                        MoviesListView(movies: viewModel.nowPlayingMovies)
                    case .upcoming:
                        MoviesListView(movies: viewModel.upcomingMovies)
                    }
                    
                }
            }
            .padding()
        }
        .onAppear {
            viewModel.getNowPlayingMovies()
            viewModel.getUpcomingMovies()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView(viewModel: MoviesListViewModel())
    }
}
