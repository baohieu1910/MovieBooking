//
//  BookingView.swift
//  MovieBooking
//
//  Created by Hieu Le on 2/18/24.
//

import SwiftUI

struct BookingView: View {
    @Environment(\.dismiss) var dismiss
    
    @ObservedObject var viewModel = BookingDetailViewModel()
    
    let theaterName: String
    let movieID: Int
    let date: Date
    let time: String
    
    let columns = Array(repeating: GridItem(), count: 9)
    
    @State var bookingStatus = [Bool](repeating: false, count: 64)
    
    var body: some View {
        VStack {
            ScrollView(showsIndicators: false) {
                VStack {
                    LazyVGrid(columns: columns) {
                        ForEach(0..<63) { num in
                            if viewModel.checkConflicts(bookingCode: getCode(seatNum: num)) {
                                RoundedRectangle(cornerRadius: 5)
                                    .fill(.gray)
                                    .frame(width: UIScreen.screenWidth / 12, height: UIScreen.screenWidth / 12)
                            } else {
                                Button {
                                    print(getCode(seatNum: num))
                                    bookingStatus[num].toggle()
                                    
                                } label: {
                                    if bookingStatus[num] {
                                        RoundedRectangle(cornerRadius: 5)
                                            .fill(.orange)
                                            .frame(width: UIScreen.screenWidth / 12, height: UIScreen.screenWidth / 12)
                                    } else {
                                        RoundedRectangle(cornerRadius: 5)
                                            .stroke(Color.gray)
                                            .frame(width: UIScreen.screenWidth / 12, height: UIScreen.screenWidth / 12)
                                    }
                                }
                            }
                        }
                    }
                }
                                
                HStack {
                    HStack {
                        RoundedRectangle(cornerRadius: 5)
                            .stroke(Color.gray)
                            .frame(width: UIScreen.screenWidth / 12, height: UIScreen.screenWidth / 12)
                        
                        Text(": Available")
                    }
                    
                    HStack {
                        RoundedRectangle(cornerRadius: 5)
                            .fill(.orange)
                            .frame(width: UIScreen.screenWidth / 12, height: UIScreen.screenWidth / 12)
                        
                        Text(": Selected")
                    }
                    
                    HStack {
                        RoundedRectangle(cornerRadius: 5)
                            .fill(.gray)
                            .frame(width: UIScreen.screenWidth / 12, height: UIScreen.screenWidth / 12)
                        
                        Text(": Booked")
                    }
                }
            }
            
            if countNumBooking() > 0 {
                Button {
                    var bookingList = [BookingDetail]()
                    
                    for index in bookingStatus.indices {
                        if bookingStatus[index] {
                            let booking = BookingDetail(movieID: movieID, theaterName: theaterName, date: date, time: time, seatNum: index)
                            bookingList.append(booking)
                        }
                    }
                    
                    viewModel.addBookingList(bookings: bookingList)
                    
                    dismiss()
                } label: {
                    Text("Buy Ticket")
                        .padding()
                        .foregroundColor(.white)
                        .background(.orange)
                        .cornerRadius(10)
                }
            }
        }
        .padding(.horizontal)
        .navigationTitle("Select Seats")
    }
    
    func getCode(seatNum: Int) -> String {
        return theaterName + String(movieID) + date.dayMonthYear() + time + String(seatNum)
    }
    
    func countNumBooking() -> Int {
        var count = 0
        
        for status in bookingStatus {
            if status {
                count += 1
            }
        }
        
        return count
    }
}

struct BookingView_Previews: PreviewProvider {
    static var previews: some View {
        BookingView(theaterName: "ABC", movieID: 1, date: Date.now, time: "9:00")
    }
}
