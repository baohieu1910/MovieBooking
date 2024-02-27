//
//  ContentView.swift
//  MovieBooking
//
//  Created by Hieu Le on 2/9/24.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var colorSchemeManager = ColorSchemeManager.shared
    
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house")
                }
                .environment(\.colorScheme, ColorSchemeManager.shared.isLight ? .light : .dark)
            
            TheaterListView()
                .tabItem {
                    Label("Theater", systemImage: "camera.metering.partial")
                }
                .environment(\.colorScheme, ColorSchemeManager.shared.isLight ? .light : .dark)
            
            UserView()
                .tabItem {
                    Label("User", systemImage: "person")
                }
                .environment(\.colorScheme, ColorSchemeManager.shared.isLight ? .light : .dark)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
