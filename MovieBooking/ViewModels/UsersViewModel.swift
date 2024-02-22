//
//  UsersViewModel.swift
//  MovieBooking
//
//  Created by Hieu Le on 2/20/24.
//

import Foundation
import SwiftUI

struct UserDetail: Codable {
    var user: User
    var bookings: [BookingDetail]
    
}

class UsersViewModel: ObservableObject {
    @Published var users: [UserDetail] = []
    
    init() {
        load()
    }
}

extension UsersViewModel {
    func addBookingList(user: User, bookings: [BookingDetail]) {
        for index in users.indices {
            if users[index].user.username == user.username {
                var userDetail = users[index]
                for booking in bookings {
                    userDetail.bookings.append(booking)
                }
                users[index] = userDetail
            }
        }
        
        save()
        load()
    }
    
    func getBookingHistory(user: User) -> [BookingDetail] {
        for userDetail in users {
            if userDetail.user.username == user.username {
                return userDetail.bookings
            }
        }
        
        return []
    }
    
    func checkBookings(bookingCode: String) -> Bool {
        for userDetail in users {
            for booking in userDetail.bookings {
                if booking.getCode() == bookingCode {
                    return true
                }
            }
        }
        return false
    }
    
    func addUser(user: User, bookings: [BookingDetail]) {
        let newUser = UserDetail(user: user, bookings: bookings)
        users.append(newUser)
            
        save()
        load()
    }
    
    func checkLogin(username: String, password: String) -> Bool {
        for userDetail in users {
            if userDetail.user.username.uppercased() == username.uppercased() && userDetail.user.password == password {
                return true
            }
        }
        
        return false
    }
    
    func checkUsername(username: String) -> Bool {
        for userDetail in users {
            if username.uppercased() == userDetail.user.username.uppercased() {
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
//        self.users = try! JSONDecoder().decode([UserDetail].self, from: data)
        guard let users = try? JSONDecoder().decode([UserDetail].self, from: data) else {
            return
        }
        self.users = users
    }
}

private extension UsersViewModel {
    
}
