//
//  ContentView.swift
//  weather-app
//
//  Created by Alex King on R 4/08/20.
//

import SwiftUI

struct ContentView: View {
    
    @State private var isNight = false
    
    var body: some View {
        ZStack {
            BackgroundView( isNight: $isNight)
            VStack {
                CityTextView( cityName: "Sydney, NSW" )
                VStack( spacing: 12 ) {
                    PrimaryWeatherStatusView( imageName: isNight ? "moon.stars.fill" : "cloud.sun.fill",
                                              temperature: 17)
                }
                .padding( .bottom, 40 )
                
                HStack( spacing: 20 ) {
                    WeatherDayView( dayOfWeek: "Tue",
                                    imageName: "cloud.sun.fill",
                                    temperature: 18 )
                    WeatherDayView( dayOfWeek: "Wed",
                                    imageName: "sun.max.fill",
                                    temperature: 21 )
                    WeatherDayView( dayOfWeek: "Thu",
                                    imageName: "cloud.sun.fill",
                                    temperature: 18 )
                    WeatherDayView( dayOfWeek: "Fri",
                                    imageName: "cloud.sun.rain.fill",
                                    temperature: 18 )
                    WeatherDayView( dayOfWeek: "Sat",
                                    imageName: "wind",
                                    temperature: 18 )
                    
                }
                Spacer()
                Button {
                    isNight.toggle()
                } label: {
                    ConfigureLocationButton( title: "configure location",
                                             textColor: .blue,
                                             backgroundColor: .white )
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
    var temperature: Int
    
    
    var body: some View {
        VStack {
            Text( dayOfWeek )
                .font( .system( size: 16,
                                weight: .medium,
                                design: .default) )
                .foregroundColor( .white )
                .padding(12)
            Image( systemName: imageName )
                .renderingMode( .original )
                .resizable()
                .aspectRatio( contentMode: .fit )
                .frame( width: 40,
                        height: 40 )
            Text("\(temperature)°")
                .font( .system( size: 28,
                                weight: .medium ) )
                .foregroundColor( .white )
        }
    }
}


struct BackgroundView: View {
    
    @Binding var isNight: Bool
    
    var body: some View {
        LinearGradient( gradient: Gradient( colors: [isNight ? .black : .blue, isNight ? .gray : Color("lightBlue")] ),
                        startPoint: .topLeading,
                        endPoint: .bottomTrailing )
            .edgesIgnoringSafeArea( .all )
    }
}

struct CityTextView: View {
    var cityName: String
    var body: some View {
        Text( cityName )
            .font( .system( size: 32,
                            weight: .medium,
                            design: .default ) )
            .foregroundColor( .white )
            .padding()
    }
}

struct PrimaryWeatherStatusView: View {
    var imageName: String
    var temperature: Int
    
    var body: some View {
        Image( systemName: imageName )
            .renderingMode( .original )
            .resizable()
            .aspectRatio( contentMode: .fit )
            .frame( width: 180,
                    height: 180 )
        Text("\(temperature)°")
            .font( .system( size: 70,
                          weight: .medium ) )
            .foregroundColor( .white )
    }
}

