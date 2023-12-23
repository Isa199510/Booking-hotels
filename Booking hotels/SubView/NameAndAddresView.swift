//
//  NameAndAddresView.swift
//  Booking hotels
//
//  Created by Иса on 22.12.2023.
//

import SwiftUI

struct NameAndAddresView: View {
    
    let name: String
    let adress: String
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(name)
                    .font(.system(size: 22, weight: .semibold))
                Text(adress)
                    .foregroundColor(.blue)
                    .font(.system(size: 14, weight: .semibold))
                    .padding(.top, -10)
            }
            
            Spacer()
        }
    }
}

struct NameAndAddresView_Previews: PreviewProvider {
    static var previews: some View {
        NameAndAddresView(name: "Name", adress: "Adress")
    }
}
