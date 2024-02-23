//
//  BookingHistory.swift
//  MovieBooking
//
//  Created by Hieu Le on 2/22/24.
//

import SwiftUI

struct BookingHistory: View {
    var bookingHistory: [Bookings]
    
    var body: some View {
        List {
            Section("Time") {
                ForEach(bookingHistory) { booking in
                    NavigationLink {
                        Form {
                            Section("Theater") {
                                Text("\(booking.theaterName ?? "")")
                            }
                            
                            Section("Movie") {
                                Text("\(booking.movieName ?? "")")
                            }
                            
                            Section("Date") {
                                Text("\(booking.date?.dayMonthYear() ?? "")")
                            }
                            
                            Section("Time") {
                                Text("\(booking.time ?? "")")
                            }
                            
                            Section("Seat") {
                                Text("\(booking.seatNum )")
                            }
                        }
                    } label: {
                        Text("\(booking.dateBooking?.getHour() ?? "")")
                    }
                }
            }
        }
    }
}

struct BookingHistory_Previews: PreviewProvider {
    static var previews: some View {
        BookingHistory(bookingHistory: [])
    }
}
