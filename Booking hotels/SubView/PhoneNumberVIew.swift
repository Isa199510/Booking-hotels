//
//  PhoneNumberVIew.swift
//  Booking hotels
//
//  Created by Иса on 23.12.2023.
//

import SwiftUI

struct PhoneNumberVIew: View {
    
    @Binding var text: String
    @State var isValide: Bool = false
    
    var placeHolder: LocalizedStringKey
    var keyboardType: UIKeyboardType = .default
    
    let mask = "+7 (***) ***-**-**"
    
    var body: some View {
        TextField("", text: $text)
            .modifier(TopFloatingHolder(noText: text.isEmpty, placeHolderKey: placeHolder))
            .keyboardType(keyboardType)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(isValide ? .clear : .red, lineWidth: 1)
            )
            .animation(.easeOut(duration: 0.4), value: isValide)
            .frame(height: 52)
            .padding(.vertical)
            .onChange(of: text) { [self] _ in
                let clear = text.filter { "0123456789".contains($0) }
                text = clear.formatUserInput(pattern: mask)
                isValide = (text.count == mask.count)
            }
    }
}

struct PhoneNumberVIew_Previews: PreviewProvider {
    static var previews: some View {
        PhoneNumberVIew(text: .constant("phone"), placeHolder: "Phone")
    }
}


