//
//  BookingView.swift
//  Booking hotels
//
//  Created by Иса on 21.12.2023.
//

import SwiftUI

struct BookingView: View {
    
    @ObservedObject var viewModel = BookingViewModel()
    
    @State var phoneNumber: String = ""
    @State var mail: String = ""
    
    var body: some View {
        
        NavigationStack {
            ScrollView {
                
                VStack(alignment: .leading) {
                    RatingView(ratingNumber: viewModel.booking?.horating ?? 0,
                               ratingName: viewModel.booking?.ratingName ?? "")
                    
                    NameAndAddresView(name: "Steigenberger Makadi",
                                      adress: viewModel.booking?.hotelAdress ?? "")
                }
                .padding()
                .background(.white)
                .cornerRadius(15)
                
                VStack(spacing: 15) {
                    HotelInfoView(name: "Вылет из", info: viewModel.booking?.departure ?? "")
                    HotelInfoView(name: "Страна, город", info: viewModel.booking?.arrivalCountry ?? "")
                    HotelInfoView(name: "Даты", info: (viewModel.booking?.tourDateStart ?? "") + " - " + (viewModel.booking?.tourDateStop ?? ""))
                    HotelInfoView(name: "Кол-во ночей", info: viewModel.booking?.numberOfNights.description  ?? "")
                    HotelInfoView(name: "Отель", info: "Steigenberger Makadi")
                    HotelInfoView(name: "Номер", info: viewModel.booking?.room ?? "")
                    HotelInfoView(name: "Питание", info: viewModel.booking?.nutrition ?? "")
                }
                .padding()
                .background(.white)
                .cornerRadius(15)
                
                Spacer()
                
                VStack(alignment: .leading) {
                    Text("Информация о покупателе")
                        .font(.system(size: 22, weight: .medium))
                    PhoneNumberVIew(text: $phoneNumber, placeHolder: "Номер телефона", keyboardType: .numberPad)
                    MailVIew(text: $mail, placeHolder: "Почта", keyboardType: .emailAddress)
                    Spacer()
                    Text("Эти данные никому не передаются. После оплаты мы вышли чек на указанный вами номер и почту")
                        .foregroundColor(.gray)
                        .font(.system(size: 14))
                }
                .padding()
                .background(.white)
                .cornerRadius(15)
                
                ForEach(viewModel.getUserValues(), id: \.self) { user in
                    VStack {
                        TouristInfoView(user: user, title: viewModel.getTitleForUser(user: user))
                            .padding()
                            .background(.white)
                            .cornerRadius(15)
                    }
                }
                
                
                HStack {
                    Text("Добавить туриста")
                        .font(.system(size: 22, weight: .medium))
                    Spacer()
                    
                    Button(action: { viewModel.addUser() }) {
                        Image(systemName: "plus")
                            .foregroundColor(.white)
                            .padding(10)
                            .background(.blue)
                            .cornerRadius(10)
                    }
                }
                .padding()
                .background(.white)
                .cornerRadius(15)
                
                VStack(spacing: 15) {
                    PaymentView(name: "Тур", price: viewModel.booking?.tourPrice ?? 0)
                    PaymentView(name: "Топливный сбор", price: viewModel.booking?.fuelCharge ?? 0)
                    PaymentView(name: "Сервисный сбор", price: viewModel.booking?.serviceCharge ?? 0)
                    PaymentView(name: "К оплате", price: viewModel.toBePaid(), colorPrice: .blue)
                }
                .padding()
                .background(.white)
                .cornerRadius(15)
                
            }
            .background(Color("mainBG"))
            
            // кнопка выбора номера
            NavigationLink(destination: PaidedView()) {
                Text("Оплатить \(viewModel.toBePaid()) ₽")
                    .foregroundColor(.white)
                    .font(.system(size: 16))
            }
            .frame(width: 343, height: 48)
            .background(.blue)
            .cornerRadius(15)
        }
        .navigationTitle("Бронирование")
        .navigationBarTitleDisplayMode(.inline)
        .toolbarRole(.editor)
        .onAppear {
            viewModel.getData()
        }
    }
}

struct BookingView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            BookingView()
        }
    }
}
