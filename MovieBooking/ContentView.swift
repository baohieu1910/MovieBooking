//
//  ContentView.swift
//  MovieBooking
//
//  Created by Hieu Le on 2/9/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        HomeView(viewModel: MoviesListViewModel())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
