//
//  UserManager.swift
//  MovieBooking
//
//  Created by Hieu Le on 2/21/24.
//

import SwiftUI
import Foundation

class UserManager: ObservableObject {
    static let shared = UserManager()
    
    @Published var currentUser : User? = nil
    
    
}
    
extension UserManager {
    func login(username: String, password: String) {
        currentUser = User(username: username, password: password)
    }
    
    func logout() {
        currentUser = nil
    }
}

private extension UserManager {
    
}
