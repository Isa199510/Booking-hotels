//
//  NumberSelectionViewModel.swift
//  Booking hotels
//
//  Created by Иса on 21.12.2023.
//

import Foundation
import UIKit

final class NumberSelectionViewModel: ObservableObject {
    
    @Published var numberSelection: NumberSelection?
    @Published var dictImages: [Int : [UIImage]] = [:]
    
    func getData() {
        dictImages = [:]
        NetworkManager.shared.fetch(from: Links.number.rawValue) { [self] result in
            switch result {
            case .success(let data):
                guard let data = try? JSONDecoder().decode(NumberSelection.self, from: data) else { return }
                DispatchQueue.main.async {
                    self.numberSelection = data
                    self.getImages()
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    private func getImages() {
//        if dictImages.isEmpty {
            guard let rooms = numberSelection?.rooms else { return }
            for room in rooms {
                for url in room.imageUrls {
                    NetworkManager.shared.fetchImage(from: url) { [self] result in
                        switch result {
                        case .success(let dataImage):
                            let uiimage = UIImage(data: dataImage)
                            self.dictImages[room.id] = (self.dictImages[room.id] ?? []) + [uiimage ?? UIImage()]
                        case .failure(let error):
                            print(error)
                        }
                    }
                }
            }
//        }
    }
}

