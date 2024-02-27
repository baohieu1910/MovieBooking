//
//  ColorSchemeManager.swift
//  MovieBooking
//
//  Created by Hieu Le on 2/27/24.
//

import Foundation
import SwiftUI

class ColorSchemeManager: ObservableObject {
    static var shared = ColorSchemeManager()
    
    @Published var isLight: Bool
    
    init() {
        isLight = true
    }
}

extension ColorSchemeManager {
    func changeColorScheme() {
        isLight.toggle()
    }
}
