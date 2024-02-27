//
//  MovieBookingApp.swift
//  MovieBooking
//
//  Created by Hieu Le on 2/9/24.
//

import SwiftUI

@main
struct MovieBookingApp: App {
    @ObservedObject var colorSchemeManager = ColorSchemeManager.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.colorScheme, colorSchemeManager.isLight ? .light : .dark)
                .environment(\.managedObjectContext, CoreDataManager.shared.viewContext)
        }
    }
}
