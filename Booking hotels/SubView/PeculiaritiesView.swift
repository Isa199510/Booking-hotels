//
//  PeculiaritiesView.swift
//  Booking hotels
//
//  Created by Иса on 22.12.2023.
//

import SwiftUI

struct PeculiaritiesView: View {
    
    let peculiarities: [String]
    
    var body: some View {
        VStack(alignment: .leading) {
            ForEach((peculiarities), id: \.self) { peculiarity in
                Text(peculiarity)
                    .font(.system(size: 13))
                    .foregroundColor(.gray)
                    .padding(5)
                    .background(Color(red: 251/255, green: 251/255, blue: 253/255))
                    .cornerRadius(5)
            }
        }
    }
}

struct PeculiaritiesView_Previews: PreviewProvider {
    static var previews: some View {
        PeculiaritiesView(peculiarities: ["One", "Two", "Three"])
    }
}
