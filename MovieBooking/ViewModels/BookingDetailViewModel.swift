//
//  BookingDetailViewModel.swift
//  MovieBooking
//
//  Created by Hieu Le on 2/19/24.
//

import SwiftUI

class BookingDetailViewModel: ObservableObject {
    @Published var details: [BookingDetail] = []
    
    init() {
        load()
    }
    
    func addBookingList(bookings: [BookingDetail]) {
        for booking in bookings {
            self.details.append(booking)
        }
        
        save()
    }
    
    func addBooking(booking: BookingDetail) {
        self.details.append(booking)
        
        save()
    }
    
    func checkConflicts(bookingCode: String) -> Bool {
        for detail in details {
            if bookingCode == detail.getCode() {
                return true
            }
        }
        
        return false
    }
    
    func save() {
        guard let data = try? JSONEncoder().encode(details) else {
            return
        }
        UserDefaults.standard.set(data, forKey: "Details")
    }
    
    func load() {
        guard let data = UserDefaults.standard.object(forKey: "Details") as? Data else {
            return
        }
        self.details = try! JSONDecoder().decode([BookingDetail].self, from: data)
    }
}
