//
//  UserListViewModel.swift
//  MovieBooking
//
//  Created by Hieu Le on 2/23/24.
//

import Foundation

class UserListViewModel: ObservableObject {
    @Published var users: [Users] = []
    
    private var bookingListViewModel = BookingListViewModel()
    
    init() {
        getAllUsers()
    }
    
    func getAllUsers() {
        users = CoreDataManager.shared.getAllUsers()
    }
    
    func addUser(username: String, password: String) {
        let newUser = Users(context: CoreDataManager.shared.viewContext)
        
        newUser.id = UUID()
        newUser.username = username
        newUser.password = password
        
        CoreDataManager.shared.saveContext()
        getAllUsers()
    }
    
    func updateUsers() {
        CoreDataManager.shared.saveContext()
        getAllUsers()
    }
    
    func checkLogin(username: String, password: String) -> Bool {
        for user in users {
            if user.username?.uppercased() == username.uppercased() && user.password == password {
                return true
            }
        }
        
        return false
    }
    
    func checkUsername(username: String) -> Bool {
        for user in users {
            if username.uppercased() == user.username?.uppercased() {
                return true
            }
        }
        
        return false
    }
    
//    func getBookingHistory() -> [Bookings] {
//        let bookingList =
//    }
}
