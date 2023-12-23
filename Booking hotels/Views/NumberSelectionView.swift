//
//  NumberSelectionView.swift
//  Booking hotels
//
//  Created by Иса on 21.12.2023.
//

import SwiftUI

struct NumberSelectionView: View {
    
    @ObservedObject var viewModel = NumberSelectionViewModel()
    
    var body: some View {
        NavigationStack {
            ScrollView {
                ForEach(viewModel.numberSelection?.rooms ?? NumberSelection.getRoom(), id: \.self) { room in
                    
                    VStack(alignment: .leading) {
                            CarouselPhotoView(images: viewModel.dictImages[room.id] ?? [UIImage()])
                        Text(room.name).font(.system(size: 25, weight: .semibold))
                        PeculiaritiesView(peculiarities: room.peculiarities)
                        
                        Text("Подробнее о номере >")
                            .padding(.all, 10)
                            .foregroundColor(.blue)
                            .background(Color(red: 233/255, green: 241/255, blue: 254/255))
                            .cornerRadius(5)
                        
                        PriceView(minimalPrice: "\(room.price.description) ₽",
                                  priceForIt: room.pricePer.lowercased())
                        
                        // кнопка выбора номера
                        NavigationLink(destination: BookingView()) {
                            Text("Выбрать номер")
                                .foregroundColor(.white)
                                .font(.system(size: 16))
                        }
                        .frame(width: 343, height: 48)
                        .background(.blue)
                        .cornerRadius(15)
                    }
                    .padding()
                    .background(.white)
                    .cornerRadius(15)
                }
                .background(Color("mainBG"))
                
            }
        }
        .navigationTitle("Steigenberger Makadi")
        .toolbarRole(.editor)
        .onAppear {
            viewModel.getData()
        }
    }
}

struct NumberSelectionView_Previews: PreviewProvider {
    static var previews: some View {
        NumberSelectionView()
    }
}
