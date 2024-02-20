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
    
    let columns = [
        GridItem(),
        GridItem(),
        GridItem(),
        GridItem()
    ]
    
    @State var status = 0
    @State var date: Date = .now
    
    var body: some View {
        
        ScrollView(showsIndicators: false) {
            VStack {
                HStack {
                    Image(systemName: "location")
                    
                    Text("\(theater.address)")
                        .lineLimit(1)
                }
                .foregroundColor(.gray)
                
                Divider()
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(0..<5) { index in
                            Button {
                                status = index
                                date = futureDate(days: index)
                                
                            } label: {
                                let date = futureDate(days: index)
                                VStack {
                                    Text("\(date.dayOfWeek())")
                                    
                                    Text("\(date.dayMonth())")
                                }
                                .foregroundColor(status == index ? .white : .black)
                                .frame(width: UIScreen.screenWidth / 3, height: UIScreen.screenWidth / 6)
                                .background(status == index ? Color("DarkBlue") : .white)
                                .cornerRadius(5)
                            }
                        }
                    }
                }
                
                Divider()
                
                ForEach(viewModel.nowPlayingMovies) { movie in
                    VStack {
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
                        
                        LazyVGrid(columns: columns) {
                            ForEach(ExampleData.times, id: \.self) { time in
                                NavigationLink {
                                    BookingView(theaterName: theater.name, movieID: movie.id, date: date, time: time)
                                } label: {
                                    Text("\(time)")
                                        .frame(width: UIScreen.screenWidth / 5, height: 40)
                                        .foregroundColor(.black)
                                        .overlay(
                                            RoundedRectangle(cornerRadius: 5)
                                                .stroke(Color.gray, lineWidth: 1)
                                        )
                                }
                            }
                        }
                        
                        Divider()
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
    
    func futureDate(days: Int) -> Date {
        return Calendar.current.date(byAdding: .day, value: days, to: Date()) ?? Date()
    }
}

struct TheaterView_Previews: PreviewProvider {
    static var previews: some View {
        TheaterView(theater: ExampleData.theater)
    }
}
