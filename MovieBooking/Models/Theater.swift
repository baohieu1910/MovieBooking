//
//  Theater.swift
//  MovieBooking
//
//  Created by Hieu Le on 2/16/24.
//

import Foundation
import SwiftUI

struct Theater: Identifiable, Hashable {
    var id = UUID()
    var name: String
    var address: String
    var hotline: String
    var imageName: String
}
