//
//  СarouselPhotoView.swift
//  Booking hotels
//
//  Created by Иса on 19.12.2023.
//

import SwiftUI

struct CarouselPhotoView: View {
    let images: [UIImage]
    var body: some View {
        TabView {
            ForEach(images, id: \.self) { image in
                Image(uiImage: image)
                    .resizable()
                    .cornerRadius(20)
            }
        }
        .tabViewStyle(.page)
        .frame(width: 343, height: 257)
        
    }
}

struct CarouselPhotoView_Previews: PreviewProvider {
    static var previews: some View {
        CarouselPhotoView(images: [UIImage(systemName: "trash") ?? UIImage()])
    }
}
