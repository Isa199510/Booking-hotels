//
//  ViewModifier's.swift
//  Booking hotels
//
//  Created by Иса on 23.12.2023.
//

import Foundation
import SwiftUI

public struct TopFloatingHolder: ViewModifier {
    
    let noText: Bool
    let placeHolderKey: LocalizedStringKey
    
    public func body(content: Content) -> some View {
        ZStack (alignment: .leading) {
            
            Text(placeHolderKey)
                .padding()
                .offset(x: 0, y: noText ? 0 : -18)
                .font(.system(size: noText ? 17 : 12))
                .foregroundColor(Color(red: 169/255, green: 171/255, blue: 183/255))
            
            content
                .font(.system(size: 17))
                .padding(.horizontal)
        }
        .padding(.top)
        .background(Color(red: 246/255, green: 246/255, blue: 249/255))
        .animation(.easeOut(duration: 0.4), value: noText)
        .cornerRadius(10)
    }
}
