//
//  BookingViewModel.swift
//  Booking hotels
//
//  Created by Иса on 21.12.2023.
//

import Foundation

final class BookingViewModel: ObservableObject {
    
    @Published var booking: Booking?
    @Published var users: [String : User] = [:]
    
    var usersCount: Int {
        get { users.keys.count }
    }
    let usersString = ["Первый турист", "Второй турист", "Третий турист", "Четвертый турист"]
    
    func getData() {
        
        NetworkManager.shared.fetch(from: Links.booking.rawValue) { [self] result in
            switch result {
            case .success(let data):
                guard let data = try? JSONDecoder().decode(Booking.self, from: data) else { return }
                DispatchQueue.main.async {
                    self.booking = data
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func getUserValues() -> [User] {
        var usersVal: [User] = []
        
        for value in self.users.values {
            usersVal.append(value)
        }
        
        return usersVal
    }
    
    func getTitleForUser(user: User) -> String {
        for (key, value) in self.users {
            if value.id == user.id {
                return key
            }
        }
        return ""
    }
    
    func toBePaid() -> Int {
        (booking?.tourPrice ?? 0) + (booking?.fuelCharge ?? 0) + (booking?.serviceCharge ?? 0)
    }
    
    func addUser() {
        self.users.updateValue(User.getUser(), forKey: usersString[usersCount])
    }
}
