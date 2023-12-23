//
//  User.swift
//  Booking hotels
//
//  Created by Иса on 23.12.2023.
//

import Foundation

struct User: Hashable, Codable {
    var id = UUID()
    var name: String
    var surname: String
    var birthday: String
    var citizenship: String
    var passportNumber: String
    var theValidityPeriodOfThePassport: String
    
    static func getUser() -> User {
        return User(name: "", surname: "", birthday: "", citizenship: "", passportNumber: "", theValidityPeriodOfThePassport: "")
    }
}
