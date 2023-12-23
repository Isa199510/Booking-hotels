//
//  PaidedView.swift
//  Booking hotels
//
//  Created by Иса on 17.12.2023.
//

import SwiftUI

struct PaidedView: View {
    
    @State var isPresented = false
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Image("hug")
                Text("Ваш заказ принят в работу")
                    .font(.system(size: 22))
                    .fontWeight(.semibold)
                    .padding(.bottom)
                
                Text("Подтверждение заказа №104893 может занять некоторое время (от 1 часа до суток). Как только мы получим ответ от туроператора, вам на почту придет уведомление.")
                    .padding()
                    .font(.system(size: 16))
                    .multilineTextAlignment(.center)
                    .foregroundColor(Color(red: 130/255, green: 135/255, blue: 150/255))
                
                Spacer()
                
                Button {
                    isPresented = true
                } label: {
                    Text("Супер!")
                        .foregroundColor(.white)
                        .font(.system(size: 16))
                }
                .frame(width: 343, height: 48)
                .background(.blue)
                .cornerRadius(15)
            }

        }
        .navigationTitle("Заказ оплачен")
        .toolbarRole(.editor)
        .fullScreenCover(isPresented: $isPresented, onDismiss: {
            dismiss()
        }) {
            HotelVIew()
        }
    }
}

struct PaidedView_Previews: PreviewProvider {
    static var previews: some View {
        PaidedView()
    }
}
