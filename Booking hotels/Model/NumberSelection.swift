//
//  NumberSelection.swift
//  Booking hotels
//
//  Created by Иса on 18.12.2023.
//

// MARK: - Welcome
struct NumberSelection: Codable, Hashable {
    
    let rooms: [Room]
    
    static func getRoom() -> [Room] {
        [Room(id: 1, name: "", price: 0, pricePer: "", peculiarities: [String()], imageUrls: [String()])]
    }
}

// MARK: - Room
struct Room: Codable, Hashable {
    let id: Int
    let name: String
    let price: Int
    let pricePer: String
    let peculiarities: [String]
    let imageUrls: [String]

    enum CodingKeys: String, CodingKey {
        case id, name, price
        case pricePer = "price_per"
        case peculiarities
        case imageUrls = "image_urls"
    }
}
