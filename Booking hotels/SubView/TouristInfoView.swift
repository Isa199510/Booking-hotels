//
//  TouristInfoView.swift
//  Booking hotels
//
//  Created by Иса on 22.12.2023.
//

import SwiftUI

struct TouristInfoView: View {
    
    var user: User
    let title: String
    @State var isListSelected = false
    
    @State var name = ""
    @State var surname = ""
    @State var birthday = ""
    @State var citizenship = "" //гражданство
    @State var passportNumber = ""
    @State var theValidityPeriodOfThePassport = ""
    
    var body: some View {
        VStack {
            HStack {
                Text(title)
                    .font(.system(size: 22, weight: .medium))
                Spacer()
                
                Button {
                    isListSelected.toggle()
                } label: {
                    Image(systemName: "chevron.down")
                        .rotationEffect(.degrees(isListSelected ? -180 : 0))
                        .foregroundColor(.blue)
                        .padding(10)
                        .background(Color(red: 233/255, green: 241/255, blue: 254/255))
                        .cornerRadius(10)
                        .animation(.linear.speed(1), value: isListSelected)
                }
            }
                        
            if isListSelected {
                VStack(alignment: .leading, spacing: -5) {
                    CustomTextFieldView(text: $name, placeHolder: "Имя")
                    CustomTextFieldView(text: $surname, placeHolder: "Фамилия")
                    CustomTextFieldView(text: $birthday, placeHolder: "Дата рождения", keyboardType: .decimalPad)
                    CustomTextFieldView(text: $citizenship, placeHolder: "Гражданство")
                    CustomTextFieldView(text: $passportNumber, placeHolder: "Номер загранпаспорта")
                    CustomTextFieldView(text: $theValidityPeriodOfThePassport, placeHolder: "Срок действия загранпаспорта")
                }
                .transition(isListSelected
                            ? .move(edge: .leading).combined(with: .scale(scale: 0.1, anchor: .top)).animation(.easeInOut(duration: 0.5))
                            : .move(edge: .leading).combined(with: .scale(scale: 1, anchor: .top)).animation(.easeInOut(duration: 0.5)))
            }
            
            Spacer()
        }
        .onAppear {
            name = user.name
            surname = user.surname
            birthday = user.birthday
            citizenship = user.citizenship
            passportNumber = user.passportNumber
            theValidityPeriodOfThePassport = user.theValidityPeriodOfThePassport
        }
    }
}

struct TouristInfoView_Previews: PreviewProvider {
    static var previews: some View {
        TouristInfoView(user: User(name: "", surname: "", birthday: "", citizenship: "", passportNumber: "", theValidityPeriodOfThePassport: ""), title: "Первый турист")
    }
}
