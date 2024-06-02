//
//  WeatherButton.swift
//  Another Weather App
//
//  Created by Mahbubur Rashid Leon on 2024-05-30.
//

import SwiftUI

struct WeatherButton: View {
    var title: String
    var textColor: Color
    var backgroundColor: Color
    
    var body: some View {
        Text(title)
            .frame(width: 280, height: 50)
            .font(.system(size: 20, weight:.bold))
            .foregroundStyle(textColor)
            .background(backgroundColor)
            .cornerRadius(10)
    }
}

#Preview {
    WeatherButton(title: "This is button", textColor: .white, backgroundColor: .blue)
}
