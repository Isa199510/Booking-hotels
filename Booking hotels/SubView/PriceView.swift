//
//  PriceView.swift
//  Booking hotels
//
//  Created by Иса on 22.12.2023.
//

import SwiftUI

struct PriceView: View {
    
    let minimalPrice: String
    let priceForIt: String
    
    var body: some View {
        HStack {
            Text(minimalPrice)
                .font(.system(size: 30, weight: .semibold))
            Text(priceForIt.lowercased())
                .foregroundColor(.gray)
            Spacer()
        }
    }
}

struct PriceView_Previews: PreviewProvider {
    static var previews: some View {
        PriceView(minimalPrice: 130000.description, priceForIt: "price for it")
    }
}
