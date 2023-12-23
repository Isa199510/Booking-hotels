//
//  HotelInfoView.swift
//  Booking hotels
//
//  Created by Иса on 22.12.2023.
//

import SwiftUI

struct HotelInfoView: View {
    
    let name: String
    let info: String
    
    var body: some View {
        HStack {
            HStack{
                Text(name)
                    .foregroundColor(.gray)
                Spacer()
            }
            .frame(width: UIScreen.main.bounds.width * 0.4)
            
            Spacer()
            HStack {
                Text(info)
                Spacer()
            }
        }
    }
}

struct HotelInfoView_Previews: PreviewProvider {
    static var previews: some View {
        HotelInfoView(name: "Name", info: "Info")
    }
}
