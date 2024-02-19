//
//  BookingView.swift
//  MovieBooking
//
//  Created by Hieu Le on 2/18/24.
//

import SwiftUI

struct BookingView: View {
    let theaterName: String
    let movieID: Int
    let date: Date
    let time: String
    
    let columns = Array(repeating: GridItem(), count: 9)
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                LazyVGrid(columns: columns) {
                    ForEach(0..<63) { num in
                        Button {
                            print(getCode(seatNum: num))
                        } label: {
                            RoundedRectangle(cornerRadius: 5)
//                                .stroke([0, 8, 9, 17].contains(num) ? Color.clear : Color.gray, lineWidth: 1)
                                .stroke(Color.gray)
                                .frame(width: UIScreen.screenWidth / 12, height: UIScreen.screenWidth / 12)
                        }
                    }
                }
                
            }
            
            
        }
        .padding(.horizontal)
    }
    
    func getCode(seatNum: Int) -> String {
        return theaterName + String(movieID) + date.dayMonthYear() + time + String(seatNum)
    }
}

struct BookingView_Previews: PreviewProvider {
    static var previews: some View {
        BookingView(theaterName: "ABC", movieID: 1, date: Date.now, time: "9:00")
    }
}
