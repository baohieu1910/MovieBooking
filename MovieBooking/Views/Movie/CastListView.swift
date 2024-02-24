//
//  CastListView.swift
//  MovieBooking
//
//  Created by Hieu Le on 2/15/24.
//

import SwiftUI

struct CastListView: View {
    @ObservedObject var viewModel: CastListViewModel
    
    let imageWidth = UIScreen.screenWidth / 5
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(viewModel.casts) { cast in
                    let url = URL(string: Utils.getCastImage(profilePath: cast.profilePath))
                    AsyncImage(url: url) { image in
                        VStack {
                            image
                                .resizable()
                                .scaledToFit()
                                .frame(width: imageWidth)
                                .scaledToFill()
                                .frame(width: imageWidth, height: imageWidth)
                                .clipped()
                                .cornerRadius(90)
                            
                            Text("\(cast.name ?? "N/A")")
                                .frame(width: imageWidth, height: imageWidth * 2 / 3)
                                .lineLimit(2)
                            
                        }
                        .frame(width: imageWidth, height: imageWidth * 5 / 3)
                    } placeholder: {
                        ProgressView()
                            .frame(width: imageWidth, height: imageWidth * 5 / 3)
                    }
                    .padding()
                    

                }
            }
        }
    }
}

struct CastListView_Previews: PreviewProvider {
    static var previews: some View {
        CastListView(viewModel: CastListViewModel())
    }
}
