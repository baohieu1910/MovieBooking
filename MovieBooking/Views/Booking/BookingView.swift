//
//  BookingView.swift
//  MovieBooking
//
//  Created by Hieu Le on 2/18/24.
//

import SwiftUI

struct ScreenShape: Shape {
    var screenCurveture: CGFloat = 30
    var isClip = false
    
    func path(in rect: CGRect) -> Path {
        
        return Path{ path in
            path.move(to: CGPoint(x: rect.origin.x + screenCurveture, y: rect.origin.y +  screenCurveture))
            path.addQuadCurve(to: CGPoint(x: rect.width - screenCurveture, y: rect.origin.y + screenCurveture), control: CGPoint(x: rect.midX, y: rect.origin.y) )
            if isClip{
                path.addLine(to: CGPoint(x: rect.width, y: rect.height))
                path.addLine(to: CGPoint(x: rect.origin.x, y: rect.height))
                path.closeSubpath()
            }
        }
    }
}

struct BookingView: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var userManager = UserManager.shared
    @ObservedObject var viewModel = UsersViewModel()
    
    let theaterName: String
    let movieID: Int
    let movieName: String
    let date: Date
    
    @State var time: String
    @State var bookingStatus = [Bool](repeating: false, count: 64)
    let columns = Array(repeating: GridItem(), count: 9)
    @State var showLoginSheet = false
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                ZStack {
                    Rectangle()
                        .fill(LinearGradient(gradient: Gradient(colors: [Color.orange.opacity(0.3), .clear]) , startPoint: .init(x: 0.5, y: 0.0), endPoint: .init(x: 0.5, y: 0.5)) )
                        .frame(height: 420)
                        .clipShape(ScreenShape(isClip: true))
                        .cornerRadius(20)
                    
                    ScreenShape()
                        .stroke(style:  StrokeStyle(lineWidth: 5,  lineCap: .square ))
                        .frame(height: 420)
                        .foregroundColor(Color.gray)
                    
                    
                    LazyVGrid(columns: columns) {
                        ForEach(0..<63) { num in
                            if viewModel.checkBookings(bookingCode: getCode(seatNum: num)) {
                                RoundedRectangle(cornerRadius: 5)
                                    .fill(.gray)
                                    .frame(width: UIScreen.screenWidth / 12, height: UIScreen.screenWidth / 12)
                            } else {
                                Button {
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
                    .padding(.vertical)
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
                .padding(.vertical)
                
                VStack(alignment: .leading) {
                    Text("Time")
                        .font(.system(size: 25, weight: .bold))
                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack {
                            ForEach(ExampleData.times, id: \.self) { time in
                                Button {
                                    self.time = time
                                    
                                } label: {
                                    Text("\(time)")
                                        .padding(.vertical)
                                        .padding(.horizontal, 25)
                                        .foregroundColor(.white)
                                        .background(self.time == time ? .orange : .gray)
                                        .cornerRadius(5)
                                }
                            }
                        }
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                
                Spacer()
                
                HStack {
                    VStack {
                        Text("\(String(countNumBooking())) seats")
                        
                        Text("$\(countNumBooking() * 20)")
                            .font(.system(size: 25, weight: .bold))
                            .foregroundColor(.orange)
                        
                    }
                    
                    Spacer()
                    
                    if countNumBooking() > 0 {
                        Button {
                            if let user = userManager.currentUser {
                                var bookingList = [Booking]()
                                
                                for index in bookingStatus.indices {
                                    if bookingStatus[index] {
                                        let booking = Booking(movieID: movieID, movieName: movieName, theaterName: theaterName, date: date, time: time, seatNum: index, dateBooking: Date.now)
                                        bookingList.append(booking)
                                    }
                                }
                                
                                viewModel.addBookingList(user: userManager.currentUser ?? User(username: "", password: ""), bookings: bookingList)
                                
                                dismiss()
                            } else {
                                showLoginSheet.toggle()
                            }
                        } label: {
                            Text("Buy Ticket")
                                .padding(.vertical)
                                .padding(.horizontal, 40)
                                .foregroundColor(.white)
                                .background(.orange)
                                .cornerRadius(10)
                        }
                        .sheet(isPresented: $showLoginSheet) {
                            LoginView()
                        }
                        
                    } else {
                        Text("Buy Ticket")
                            .padding(.vertical)
                            .padding(.horizontal, 40)
                            .foregroundColor(.white)
                            .background(.gray)
                            .cornerRadius(10)
                    }
                }
                .padding(.horizontal)
                
                
            }
            .padding(.horizontal)
            .navigationTitle("Select Seats")
        }
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

//struct BookingView_Previews: PreviewProvider {
//    static var previews: some View {
//        BookingView(theaterName: "ABC", movieID: 1, date: Date.now, time: "9:00")
//    }
//}
