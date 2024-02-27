//
//  UserManager.swift
//  MovieBooking
//
//  Created by Hieu Le on 2/21/24.
//

import SwiftUI
import Foundation

class UserManager: ObservableObject {
    static var shared = UserManager()
    @Published var currentUser: Users? = nil
    
}
    
extension UserManager {
    func login(username: String, password: String) {
        let newUser = Users(context: CoreDataManager.shared.viewContext)
        newUser.username = username
        newUser.password = password
        currentUser = newUser
    }
    
    func logout() {
        currentUser = nil
    }
}

private extension UserManager {
    
}
