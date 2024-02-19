//
//  MovieDetailView.swift
//  MovieBooking
//
//  Created by Hieu Le on 2/15/24.
//

import SwiftUI

struct MovieDetailView: View {
    @ObservedObject var viewModel: MovieDetailViewModel
    @ObservedObject var imagesVM = ImageListsViewModel()
    @ObservedObject var castVM = CastListViewModel()
    @ObservedObject var theaterVM = TheaterListViewModel()
    
    var movie: Movie
    
    @State var date: Date = .now
    
    @State var isShowMore = false
    enum Status {
        case show
        case information
        case news
    }
    @State var status: Status = .show
    @State var dateStatus = 0
    
    let columns = [
        GridItem(),
        GridItem(),
        GridItem(),
        GridItem()
    ]
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                VStack {
                    let urlBG = URL(string: Utils.getMovieBackground(backdropPath: movie.backdropPath))
                    AsyncImage(url: urlBG) { firstImage in
                        ZStack {
                            firstImage
                                .resizable()
                                .scaledToFit()
                                .frame(width: UIScreen.screenWidth)
                            
                            let url = URL(string: Utils.getMoviePoster(posterPath: movie.posterPath))
                            AsyncImage(url: url) { secondImage in
                                HStack {
                                    secondImage
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: UIScreen.screenWidth / 5)
                                        .cornerRadius(5)
                                        .padding(.leading)
                                    
                                    VStack(alignment: .leading) {
                                        HStack {
                                            Image(systemName: "star.fill")
                                                .foregroundColor(.yellow)
                                            
                                            Text("\(viewModel.movie?.voteAverage ?? 0, specifier: "%.1f")")
                                            
                                        }
                                        
                                        HStack {
                                            Image(systemName: "clock")
                                                .foregroundColor(.orange)
                                            Text("\(viewModel.movie?.runtime ?? 0) mins")
                                                .foregroundColor(.gray)
                                            
                                            Image(systemName: "calendar")
                                                .foregroundColor(.orange)
                                            
                                            Text("\(Utils.getReleaseDate(releaseDate: viewModel.movie?.releaseDate))")
                                                .foregroundColor(.gray)
                                        }
                                    }
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                }
                                .offset(x: 0, y: UIScreen.screenWidth * 2 / 7)
                                
                            } placeholder: {
                                ProgressView()
                            }
                        }
                        
                    } placeholder: {
                        ProgressView()
                            .frame(width: UIScreen.screenWidth, height: UIScreen.screenWidth * 7 / 8)
                    }
                }
                .frame(width: UIScreen.screenWidth, height: UIScreen.screenWidth * 7 / 8)
                
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
                        Text("Overview")
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
                        VStack {
                            ScrollView(.horizontal, showsIndicators: false) {
                                HStack {
                                    ForEach(0..<5) { index in
                                        Button {
                                            dateStatus = index
                                            date = futureDate(days: index)
                                            
                                        } label: {
                                            let date = futureDate(days: index)
                                            VStack {
                                                Text("\(date.dayOfWeek())")
                                                
                                                Text("\(date.dayMonth())")
                                            }
                                            .foregroundColor(dateStatus == index ? .white : .black)
                                            .frame(width: UIScreen.screenWidth / 3, height: UIScreen.screenWidth / 6)
                                            .background(dateStatus == index ? Color("DarkBlue") : .white)
                                            .cornerRadius(5)
                                        }
                                    }
                                }
                            }
                            
                            VStack(alignment: .leading) {
                                ForEach(theaterVM.theaters) { theater in
                                    VStack(alignment: .leading) {
                                        Text("\(theater.name)")
                                            .font(.system(size: 18, weight: .bold))
                                        
                                        LazyVGrid(columns: columns) {
                                            ForEach(ExampleData.times, id: \.self) { time in
                                                NavigationLink {
                                                    BookingView(theaterName: theater.name, movieID: viewModel.movie?.id ?? 0, date: date, time: time)
                                                } label: {
                                                    Text("\(time)")
                                                        .frame(width: UIScreen.screenWidth / 5, height: 40)
                                                        .overlay(
                                                            RoundedRectangle(cornerRadius: 5)
                                                                .stroke(Color.gray, lineWidth: 1)
                                                        )
                                                        .foregroundColor(.black)
                                                }
                                            }
                                        }
                                    }
                                    .frame(maxWidth: .infinity, alignment: .leading)
                                }
                            }
                            
                        }
                        .padding(.horizontal)
                        
                    case .information:
                        VStack(alignment: .leading) {
                            VStack(alignment: .leading) {
                                Text("Information")
                                    .font(.system(size: 18, weight: .bold))
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
                            VStack(alignment: .leading) {
                                Text("Cast")
                                    .font(.system(size: 18, weight: .bold))
                                
                                CastListView(viewModel: castVM)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                            
                            Divider()
                            
                            VStack(alignment: .leading) {
                                Text("Media")
                                    .font(.system(size: 18, weight: .bold))
                                
                                ImageListView(viewModel: imagesVM)
                            }
                            .frame(maxWidth: .infinity, alignment: .leading)
                        }
                        .padding(.horizontal)
                    case .news:
                        VStack {
                            Image(systemName: "film")
                                .font(.system(size: 50))
                            
                            Text("This movie's news is being updated.")
                        }
                        .foregroundColor(.gray)
                        .padding(.vertical, UIScreen.screenWidth / 4)
                        .padding(.horizontal)
                    }
                }
            }
        }
        .ignoresSafeArea(edges: .top)
        .navigationTitle("\(viewModel.movie?.title ?? "N/A")")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear {
            viewModel.getMovieDetail(id: movie.id)
            imagesVM.getImagesList(id: movie.id)
            castVM.getCastList(id: movie.id)
        }
    }
    
    func futureDate(days: Int) -> Date {
        return Calendar.current.date(byAdding: .day, value: days, to: Date()) ?? Date()
    }
}

struct MovieDetailView_Previews: PreviewProvider {
    static var previews: some View {
        MovieDetailView(viewModel: MovieDetailViewModel(), movie: ExampleData.movie)
    }
}
