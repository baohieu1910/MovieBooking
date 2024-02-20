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
            Theater(name: "Theater 1", address: "Nguyen Du, Q.1, TP.HCM", hotline: "11111111", imageName: "nguyen_du"),
            Theater(name: "Theater 2", address: "Mai Chi Tho, Thu Thiem, TP. Thu Duc", hotline: "22222222", imageName: "sala"),
            Theater(name: "Theater 3", address: "Q. Tan Binh, TP.HCM", hotline: "33333333", imageName: "tan_binh"),
            Theater(name: "Theater 4", address: "Kinh Duong Vuong, Q.6, TP.HCM", hotline: "44444444", imageName: "kinh_duong_vuong"),
            Theater(name: "Theater 5", address: "Quang Trung, Q.Go Vap, TP.HCM", hotline: "55555555", imageName: "quang_trung"),
            Theater(name: "Theater 6", address: "Linh Trung, Q.Thu Duc, TP.HCM", hotline: "66666666", imageName: "linh_trung")
            
        ]
    }
}

extension TheaterListViewModel {
    
}

private extension TheaterListViewModel {
    
}
