//
//  BookingDetailViewModel.swift
//  MovieBooking
//
//  Created by Hieu Le on 2/19/24.
//

import SwiftUI

class BookingDetailViewModel: ObservableObject {
    @Published var details: [BookingDetail] = []
    
    func checkConflict(bookingCode: String) -> Bool {
        for detail in details {
            if bookingCode == detail.getCode() {
                return true
            }
        }
        
        return false
    }
    
    func save() {
        
    }
    
    func load() {
        
    }
}
