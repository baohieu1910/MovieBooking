//
//  BookingListViewModel.swift
//  MovieBooking
//
//  Created by Hieu Le on 2/23/24.
//

import Foundation

class BookingListViewModel: ObservableObject {
    @Published var bookings: [Bookings] = []
    
    init() {
        getAllBookings()
    }
    
    func getAllBookings() {
        bookings = CoreDataManager.shared.getAllBookings()
    }
    
    func addBooking(user: Users, movieName: String, movieID: Int64, theaterName: String, dateBooking: Date, time: String, date: Date, seatNum: Int64) {
        let newBooking = Bookings(context: CoreDataManager.shared.viewContext)
        
        newBooking.id = UUID()
        newBooking.movieName = movieName
        newBooking.movieID = movieID
        newBooking.theaterName = theaterName
        newBooking.dateBooking = dateBooking
        newBooking.date = date
        newBooking.time = time
        newBooking.seatNum = seatNum
        
        user.addToBookings(newBooking)
        
        CoreDataManager.shared.saveContext()
        getAllBookings()
    }
    
    func updateBookings() {
        CoreDataManager.shared.saveContext()
        getAllBookings()
    }
    
    func checkBookings(bookingCode: String) -> Bool {
        for booking in bookings {
            if booking.getCode() == bookingCode {
                return true
            }
        }
        return false
    }
}
