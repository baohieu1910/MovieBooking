//
//  UsersViewModel.swift
//  MovieBooking
//
//  Created by Hieu Le on 2/20/24.
//

import Foundation
import SwiftUI

class UsersViewModel: ObservableObject {
    @Published var users: [User] = []
    
    init() {
        load()
    }
}

extension UsersViewModel {
    func add(user: User) {
        users.append(user)
            
        save()
    }
    
    func checkUsername(username: String) -> Bool {
        for user in users {
            if username == user.username {
                return true
            }
        }
        
        return false
    }
    
    func save() {
        guard let data = try? JSONEncoder().encode(users) else {
            return
        }
        UserDefaults.standard.set(data, forKey: "Users")
    }
    
    func load() {
        guard let data = UserDefaults.standard.object(forKey: "Users") as? Data else {
            return
        }
        self.users = try! JSONDecoder().decode([User].self, from: data)
    }
}

private extension UsersViewModel {
    
}
