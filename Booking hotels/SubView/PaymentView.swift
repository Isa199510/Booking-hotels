//
//  PaymentView.swift
//  Booking hotels
//
//  Created by Иса on 22.12.2023.
//

import SwiftUI

struct PaymentView: View {
    
    let name: String
    let price: Int
    var colorPrice: Color = .black
    
    var body: some View {
        HStack {
            Text(name)
                .foregroundColor(.gray)
            Spacer()
            Text("\(price) ₽")
                .foregroundColor(colorPrice)
        }
    }
}

struct PaymentView_Previews: PreviewProvider {
    static var previews: some View {
        PaymentView(name: "Тур", price: 120000)
    }
}
