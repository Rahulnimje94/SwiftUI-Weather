//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Rahul Nimje on 26/09/22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            
            VStack(spacing:8) {
                CityNameView(cityName: "Banglore, KA")
                
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill", tempreture: 74)
                
                HStack(spacing: 20){
                    WeatherDayView(dayOfWeek: "TUE", imageName: "cloud.sun.fill", tempreture: 74)
                    WeatherDayView(dayOfWeek: "WED", imageName: "cloud.sun.rain.fill", tempreture: 67)
                    WeatherDayView(dayOfWeek: "THU", imageName: "wind.snow", tempreture: 55)
                    WeatherDayView(dayOfWeek: "FRI", imageName: "sun.max.fill", tempreture: 80)
                    WeatherDayView(dayOfWeek: "SAT", imageName: "snowflake", tempreture: 24)
                }
                
                Spacer()
                
                Button {
                    isNight.toggle()
                } label: {
                    WeatherButton(title: "Change Day Time", textColor: .blue, backgroundColor: .white)
                }
                
                Spacer()
            }
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WeatherDayView: View {
    
    var dayOfWeek: String
    var imageName: String
    var tempreture: Int
    
    var body: some View {
        VStack(spacing:4){
            Text(dayOfWeek).font(.system(size: 16, weight: .medium, design: .default)).foregroundColor(.white)
            
            VStack{
                Image(systemName: imageName).renderingMode(.original).resizable().aspectRatio(contentMode: .fit).frame(width: 40, height: 40)
                
                Text("\(tempreture)°").font(.system(size: 28, weight: .medium)).foregroundColor(.white)
            }
        }
    }
}

struct BackgroundView: View {
    
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct CityNameView: View {
    
    var cityName: String
    
    var body: some View {
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default)).foregroundColor(.white).padding()
    }
}

struct MainWeatherStatusView: View {
    
    var imageName: String
    var tempreture: Int
    
    var body: some View {
        VStack {
            Image(systemName: imageName).renderingMode(.original)
                .resizable().aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            
            Text("\(tempreture)°").font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }.padding(.bottom, 40)
    }
}

