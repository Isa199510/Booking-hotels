//
//  MailVIew.swift
//  Booking hotels
//
//  Created by Иса on 23.12.2023.
//

import SwiftUI

struct MailVIew: View {
    @Binding var text: String
    @State var isEmailValide: Bool = false
    
    var placeHolder: LocalizedStringKey
    var keyboardType: UIKeyboardType = .default
    
    var body: some View {
        TextField("", text: $text)
            .modifier(TopFloatingHolder(noText: text.isEmpty, placeHolderKey: placeHolder))
            .keyboardType(keyboardType)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(isEmailValide ? .clear : .red, lineWidth: 1)
            )
            .animation(.easeOut(duration: 0.4), value: isEmailValide)
            .frame(height: 52)
            .padding(.vertical)
            .onChange(of: text) { _ in
                isEmailValide = isValidEmail(text)
            }
    }
    
}

struct MailVIew_Previews: PreviewProvider {
    static var previews: some View {
        MailVIew(text: .constant("Mail"), placeHolder: "Mail")
    }
}
