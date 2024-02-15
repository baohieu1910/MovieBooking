//
//  ContentView.swift
//  MovieBooking
//
//  Created by Hieu Le on 2/9/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView(viewModel: MoviesListViewModel())
                .tabItem {
                    Label("Home", systemImage: "house")
                }
            
            Text("Hello")
                .tabItem {
                    Label("User", systemImage: "person")
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
