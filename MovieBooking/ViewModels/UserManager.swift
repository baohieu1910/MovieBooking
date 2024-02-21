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
    
    @Published var currentUser : User? = nil
    
}
    
extension UserManager {
    func login(username: String, password: String) {
        currentUser = User(username: username, password: password)
    }
    
    func logout() {
        currentUser = nil
    }
    
//    func save() {
//        guard let data = try? JSONEncoder().encode(self) else {
//            return
//        }
//        UserDefaults.standard.set(data, forKey: "UserManager")
//    }
//
//    func load() {
//        guard let data = UserDefaults.standard.object(forKey: "UserManager") as? Data else {
//            return
//        }
//        let userManager = try? JSONDecoder().decode(UserManager.self, from: data)
//        self.currentUser = userManager?.currentUser
////        currentUser = try! JSONDecoder().decode(User.self, from: data)
//    }
}

private extension UserManager {
    
}
