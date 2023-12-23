//
//  RatingView.swift
//  Booking hotels
//
//  Created by Иса on 19.12.2023.
//

import SwiftUI

struct RatingView: View {
    let ratingNumber: Int
    let ratingName: String
    var body: some View {
        HStack {
            Image(systemName: "star.fill")
                .foregroundColor(Color("colorForStar"))
            Text("\(ratingNumber)")
                .foregroundColor(Color("colorForStar"))
            Text(ratingName)
                .foregroundColor(Color("colorForStar"))
        }
        .padding(10)
        .background(Color("colorRatingFG"))
        .cornerRadius(10)
    }
}

struct RaitingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(ratingNumber: 5, ratingName: "Good")
    }
}
