//
//  ContentView.swift
//  Another Weather App
//
//  Created by Mahbubur Rashid Leon on 2024-05-30.
//

import SwiftUI

struct ContentView: View {
    @State private var isNight: Bool = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: isNight)
            
            VStack {
                CityTextView(cityName: "Dhaka")
                
                MainWeatherStatusView(isNight: $isNight)
                
                HStack(spacing: 20) {
                    WeatherDayView(dayOfWeek: "SAT", imageName: "cloud.sun.rain.fill", temperature: 20)
                    WeatherDayView(dayOfWeek: "SUN", imageName: "cloud.sun.bolt.fill", temperature: 30)
                    WeatherDayView(dayOfWeek: "MON", imageName: "sun.haze.fill", temperature: 50)
                    WeatherDayView(dayOfWeek: "TUE", imageName: "sun.snow.fill", temperature: 10)
                    WeatherDayView(dayOfWeek: "WED", imageName: "snowflake", temperature: 20)
                }
                
                Spacer()
                
                Button(action: {
                    isNight.toggle()
                }, label: {
                    WeatherButton(title: "Change Day Time", textColor: .blue, backgroundColor: .white)
                })
                
                Spacer()
            }
        }
    }
}

#Preview {
    ContentView()
}

struct WeatherDayView: View {
    var dayOfWeek: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack {
            Text(dayOfWeek)
                .font(.system(size: 16, weight: .medium))
                .foregroundStyle(.white)
            
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .frame(width: 40, height: 40)
            
            Text("\(temperature)°")
                .font(.system(size: 28, weight: .medium))
                .foregroundStyle(.white)
        }
    }
}

struct BackgroundView: View {
    var isNight: Bool
    
    var body: some View {
        LinearGradient(
            colors: [isNight ? .black : .blue, isNight ? .gray : Color("LightBlue")],
            startPoint: .topLeading, endPoint: .bottomTrailing)
        .ignoresSafeArea()
    }
}

struct CityTextView: View {
    var cityName: String
    
    var body: some View {
        Text("\(cityName), Bangladesh")
            .font(.system(size: 30, weight: .medium))
            .foregroundStyle(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    @Binding var isNight: Bool
    
    var body: some View {
        VStack(spacing: 10) {
            Image(systemName: isNight ? "moon.stars.fill" : "cloud.sun.fill")
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 180, height: 180)
            
            Text("\(isNight ? 10 : 40)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundStyle(.white)
        }.padding(.bottom, 40)
    }
}
