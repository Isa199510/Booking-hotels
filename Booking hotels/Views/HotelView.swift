//
//  HotelView.swift
//  Booking hotels
//
//  Created by Иса on 19.12.2023.
//

import SwiftUI

struct HotelVIew: View {
    
    @ObservedObject var viewModel = HotelViewModel()
    
    var body: some View {
        
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading) {
                    CarouselPhotoView(images: viewModel.images)
                    RatingView(ratingNumber: viewModel.hotel?.rating ?? 0,
                               ratingName: viewModel.hotel?.ratingName ?? "")
                    NameAndAddresView(name: viewModel.hotel?.name ?? "",
                                      adress: viewModel.hotel?.adress ?? "")
                    PriceView(minimalPrice: "от \(viewModel.hotel?.minimalPrice.description ?? "") ₽",
                              priceForIt: viewModel.hotel?.priceForIt ?? "")
                    .padding(.top)
                }
                .padding()
                .background(.white)
                .cornerRadius(20)
                
                Spacer()
                
                VStack(alignment: .leading) {
                    Text("Об отеле")
                        .font(.title2)
                    PeculiaritiesView(peculiarities: viewModel.hotel?.aboutTheHotel.peculiarities ?? [""])
                    Text(viewModel.hotel?.aboutTheHotel.description ?? "")
                    Image("aboutImage")
                        .resizable()
                        .scaledToFit()
                }
                .padding()
                .background(.white)
                .cornerRadius(20)
            }
            .navigationTitle("Отель")
            .navigationBarTitleDisplayMode(.inline)
            .background(Color("mainBG"))
            
            // кнопка выбора номера
            NavigationLink(destination: NumberSelectionView()) {
                Text("К выбору номера")
                    .foregroundColor(.white)
                    .font(.system(size: 16))
            }
            .frame(width: 343, height: 48)
            .background(.blue)
            .cornerRadius(15)
        }
        .onAppear {
            viewModel.getData()
        }
    }
}

struct HotelView_Previews: PreviewProvider {
    static var previews: some View {
        HotelVIew()
        
    }
}
