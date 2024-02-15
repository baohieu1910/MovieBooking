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
            ScrollView(showsIndicators: false) {
                VStack {
                    HStack {
                        Button {
                            status = .nowPlaying
                        } label: {
                            Text("Now playing")
                                .font(.system(size: 15))
                                .foregroundColor(status == .nowPlaying ? .blue : .gray)
                        }
                        
                        Divider()
                        
                        Button {
                            status = .upcoming
                        } label: {
                            Text("Upcoming")
                                .font(.system(size: 15))
                                .foregroundColor(status == .upcoming ? .blue : .gray)
                        }
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    
                    switch status {
                    case .nowPlaying:
                        MoviesListView(movies: viewModel.nowPlayingMovies, numItem: 6)
                    case .upcoming:
                        MoviesListView(movies: viewModel.upcomingMovies, numItem: 6)
                    }
                    
                    NavigationLink {
                        AllMovieView(viewModel: viewModel)
                    } label: {
                        HStack {
                            Text("More")
                            
                            Image(systemName: "chevron.right")
                        }
                        .padding(10)
                        .frame(width: UIScreen.screenWidth - 40)
                        .overlay(
                            RoundedRectangle(cornerRadius: 5)
                                .stroke(.orange, lineWidth: 2)
                        )
                        .foregroundColor(.orange)
                    }
                }
            }
            .padding(.horizontal)
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
