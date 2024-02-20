//
//  TheaterListView.swift
//  MovieBooking
//
//  Created by Hieu Le on 2/16/24.
//

import SwiftUI

struct TheaterListView: View {
    @ObservedObject var viewModel = TheaterListViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView(showsIndicators: false) {
                ForEach(viewModel.theaters) { theater in
                    VStack(alignment: .leading) {
                        NavigationLink {
                            TheaterView(theater: theater)
                        } label: {
                            HStack {
                                Image(theater.imageName)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: UIScreen.screenWidth / 2)
                                    .scaledToFill()
                                    .frame(width: UIScreen.screenWidth / 4, height: UIScreen.screenWidth / 6)
                                    .clipped()
                                    .cornerRadius(5)
                                
                                VStack(alignment: .leading) {
                                    Text("\(theater.name)")
                                        .font(.system(size: 18, weight: .bold))
                                    
                                    Spacer()
                                    
                                    Text("\(theater.address)")
                                        .lineLimit(1)
                                        .font(.system(size: 15))
                                    
                                    Spacer()
                                    
                                    Text("\(theater.hotline)")
                                        .font(.system(size: 15))
                                }
                                
                            }
                            .foregroundColor(.black)
                            .padding()
                        }
                        
                        Divider()
                    }
                }
            }
            .navigationTitle("Theater")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct TheaterListView_Previews: PreviewProvider {
    static var previews: some View {
        TheaterListView()
    }
}
