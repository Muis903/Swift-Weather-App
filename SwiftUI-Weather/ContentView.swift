//
//  ContentView.swift
//  SwiftUI-Weather
//
//  Created by Mikhail Ivanovskii on 14/03/2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView(isNight: $isNight)
            VStack {
                CityTextView(cityName: "Den Haag, ZH")
                
                MainWeatherStatusView(imageName: isNight ? "moon.stars.fill": "cloud.rain.fill",
                                      temprature: 7)
                
                HStack(spacing: 20){
                    
                    WeatherDayView(
                        weekDay: "TUE",
                        imageName: "cloud.rain.fill",
                        temperature: 11)
                        
                    WeatherDayView (
                        weekDay: "WED",
                        imageName: "cloud.sun.rain.fill",
                        temperature: 12)
                        
                    WeatherDayView(
                        weekDay: "THU",
                        imageName: "cloud.sun.fill",
                        temperature: 15)
                       
                    WeatherDayView(
                        weekDay: "FRI",
                        imageName: "cloud.sun.fill",
                        temperature: 16)
                        
                    WeatherDayView(
                        weekDay: "SAT",
                        imageName: "sun.max.fill",
                        temperature: 17)
                            
                    WeatherDayView(
                        weekDay: "SUN",
                        imageName: "sun.max.fill",
                        temperature: 16)
                }
                    Spacer()
                
                    Button {
                        isNight.toggle()
                    } label: {
                      WeatherButton(
                        title: "Change Day Time",
                        textColor: .blue,
                        backgroundColor: .white)
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

struct WeatherDayView: View{
    var weekDay: String
    var imageName: String
    var temperature: Int
    
    var body: some View {
        VStack(spacing: 20){
            Text(weekDay)
                .font(.system(size: 20, weight: .medium))
                .foregroundColor(.white)
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 45, height: 45)
            Text("\(temperature)°")
                .font(.system(size: 25))
                .foregroundColor(.white)
        }
    }
}

struct BackgroundView: View {
    
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [isNight ? .black : .gray, isNight ? .gray: .white]),
                       startPoint: .topLeading,
                       endPoint: .bottomTrailing)
            .edgesIgnoringSafeArea(.all)
    }
}

struct CityTextView: View {
    
    var cityName: String
    
    var body: some View{
        Text(cityName)
            .font(.system(size: 32, weight: .medium, design: .default))
            .foregroundColor(.white)
            .padding()
    }
}

struct MainWeatherStatusView: View {
    var imageName: String
    var temprature: Int
    
    var body: some View {
        VStack (spacing: 20){
            Image(systemName: imageName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 180, height: 180)
            Text("\(temprature)°")
                .font(.system(size: 70, weight: .medium))
                .foregroundColor(.white)
        }
        .padding(.bottom, 40)
    }
}
