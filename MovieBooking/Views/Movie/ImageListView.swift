//
//  ImageListView.swift
//  MovieBooking
//
//  Created by Hieu Le on 2/15/24.
//

import SwiftUI

struct ImageListView: View {
    @ObservedObject var viewModel: ImageListsViewModel
    
    let imageWidth = UIScreen.screenWidth * 2 / 3
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(viewModel.images) { image in
                    let url = URL(string: Utils.getImage(filePath: image.filePath))
                    AsyncImage(url: url) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: imageWidth)
                            .cornerRadius(5)
                        
                        
                    } placeholder: {
                        ProgressView()
                            .frame(width: imageWidth, height: imageWidth / 3)
                    }
                }
            }
        }
    }
}

struct ImageListView_Previews: PreviewProvider {
    static var previews: some View {
        ImageListView(viewModel: ImageListsViewModel())
    }
}
