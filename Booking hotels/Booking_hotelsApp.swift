//
//  Booking_hotelsApp.swift
//  Booking hotels
//
//  Created by Иса on 17.12.2023.
//

import SwiftUI

@main
struct Booking_hotelsApp: App {

    var body: some Scene {
        WindowGroup(id: "main") {
            NavigationStack {
                HotelVIew()
            }
            .onAppear {
                let appearance = UINavigationBarAppearance()
                appearance.backgroundEffect = UIBlurEffect(style: .systemUltraThinMaterial)
                appearance.backgroundColor = UIColor(Color.white.opacity(0.2))
                UINavigationBar.appearance().scrollEdgeAppearance = appearance
            }
        }
        
    }
}
