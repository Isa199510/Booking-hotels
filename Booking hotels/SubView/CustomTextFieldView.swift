//
//  CustomTextFieldView.swift
//  Booking hotels
//
//  Created by Иса on 22.12.2023.
//

import SwiftUI

struct CustomTextFieldView: View {
    
    @Binding var text: String
    
    var placeHolder: LocalizedStringKey
    var keyboardType: UIKeyboardType = .default
    
    var body: some View {
        TextField("", text: $text)
            .modifier(TopFloatingHolder(noText: text.isEmpty, placeHolderKey: placeHolder))
            .keyboardType(keyboardType)
            .frame(height: 52)
            .padding(.vertical)
    }
}

struct CustomTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextFieldView(text: .constant(""), placeHolder: "Text", keyboardType: .numberPad)
    }
}
