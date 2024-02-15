//
//  MovieDetailView.swift
//  MovieBooking
//
//  Created by Hieu Le on 2/15/24.
//

import SwiftUI

struct MovieDetailView: View {
    @ObservedObject var viewModel: MovieDetailViewModel
    var movie: Movie
    
    @State var isShowMore = false
    enum Status {
        case show
        case information
        case news
    }
    @State var status: Status = .information
    
    var body: some View {
        ScrollView {
            VStack {
                let url = URL(string: Utils.getMoviePoster(posterPath: viewModel.movie?.posterPath))
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.screenWidth / 5)
                    
                } placeholder: {
                    ProgressView()
                }
                
                HStack {
                    Button {
                        status = .show
                    } label: {
                        Text("Show")
                            .foregroundColor(status == .show ? .blue : .gray)
                            .font(.system(size: 15))
                    }
                    
                    Divider()
                        .padding(.horizontal)
                    
                    Button {
                        status = .information
                    } label: {
                        Text("Information")
                            .foregroundColor(status == .information ? .blue : .gray)
                            .font(.system(size: 15))
                    }
                    
                    Divider()
                        .padding(.horizontal)
                    
                    Button {
                        status = .news
                    } label: {
                        Text("News")
                            .foregroundColor(status == .news ? .blue : .gray)
                            .font(.system(size: 15))
                    }
                }
                
                Divider()
                
                VStack {
                    switch status {
                    case .show:
                        Text("show")
                    case .information:
                        VStack(alignment: .leading) {
                            VStack(alignment: .leading) {
                                Text("Information")
                                    .font(.system(size: 15, weight: .bold))
                                    .padding(.vertical, 10)
                                
                                Text("\(viewModel.movie?.overview ?? "N/A")")
                                    .lineLimit(isShowMore ? nil : 3)
                                
                                Button {
                                    isShowMore.toggle()
                                } label: {
                                    Text(isShowMore ? "Collapse" : "See more")
                                        .foregroundColor(.orange)
                                        .frame(maxWidth: .infinity, alignment: .center)
                                        .padding(.vertical, 5)
                                    
                                }
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Divider()
                            VStack {
                                Text("Cast")
                            }
                            
                            Divider()
                            
                            VStack {
                                Text("Media")
                            }
                            
                        }
                    case .news:
                        VStack {
                            Image(systemName: "film")
                                .font(.system(size: 50))
                            
                            Text("This movie's news is being updated.")
                            
                        }
                        .foregroundColor(.gray)
                        .padding(.vertical, UIScreen.screenWidth / 4)
                    }
                }
            }
        }
        .onAppear {
            viewModel.getMovieDetail(id: movie.id)
        }
    }
    
    
    
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(viewModel: MovieDetailViewModel(), movie: ExampleData.movie)
    }
}
