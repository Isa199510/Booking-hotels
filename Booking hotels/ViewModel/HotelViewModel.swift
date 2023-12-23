//
//  HotelViewModel.swift
//  Booking hotels
//
//  Created by Иса on 19.12.2023.
//

import Foundation
import UIKit

final class HotelViewModel: ObservableObject {
    
    @Published var hotel: Hotel?
    @Published var images: [UIImage] = []
    
    func getData() {
        images = []
        NetworkManager.shared.fetch(from: Links.hotel.rawValue) { [self] result in
            switch result {
            case .success(let data):
                guard let data = try? JSONDecoder().decode(Hotel.self, from: data) else { return }
                DispatchQueue.main.async {
                    self.hotel = data
                    self.getImages(urls: data.imageUrls)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func getImages(urls: [String]?){
//        if self.images.isEmpty {
            guard let urls = urls else { return }
            for url in urls {
                NetworkManager.shared.fetchImage(from: url) { [self] result in
                    switch result {
                    case .success(let dataImage):
                        let uiimage = UIImage(data: dataImage)
                        self.images.append(uiimage ?? UIImage())
                    case .failure(_):
                        print("no image data")
                    }
                }
            }
//        }
    }
}
