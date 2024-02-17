//
//  TheaterListViewModel.swift
//  MovieBooking
//
//  Created by Hieu Le on 2/16/24.
//

import SwiftUI
import Foundation

class TheaterListViewModel: ObservableObject {
    @Published var theaters: [Theater] = []
    
    init() {
        self.theaters = [
            Theater(name: "Galaxy Nguyen Du", address: "Nguyen Du, Q.1, TP.HCM", hotline: "11111111", imageName: "nguyen_du"),
            Theater(name: "Galaxy Sala", address: "Mai Chi Tho, Thu Thiem, TP. Thu Duc", hotline: "22222222", imageName: "sala"),
            Theater(name: "Galaxy Tan Binh", address: "Q. Tan Binh, TP.HCM", hotline: "33333333", imageName: "tan_binh"),
            Theater(name: "Galaxy Kinh Duong Vuong", address: "Kinh Duong Vuong, Q.6, TP.HCM", hotline: "44444444", imageName: "kinh_duong_vuong"),
            Theater(name: "Galaxy Quang Trung", address: "Quang Trung, Q.Go Vap, TP.HCM", hotline: "55555555", imageName: "quang_trung"),
            Theater(name: "Galaxy Linh Trung", address: "Linh Trung, Q.Thu Duc, TP.HCM", hotline: "66666666", imageName: "linh_trung")
            
        ]
    }
}

