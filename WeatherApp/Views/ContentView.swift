//
//  ContentView.swift
//  WeatherApp
//
//  Created by Chethan J on 26/12/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var locationManager = LocationManager()
    var wetherManager = WeatherManager()
    @State var weather: WeatherModel?
    
    var body: some View {
        VStack {
            
            if let location = locationManager.location {
                if let weather = weather {
                    WeatherView(weather: weather)
                } else {
                    LoadingView()
                        .task {
                            do{
                                weather = try await wetherManager.getWeatherOfCurrentLocation(latitude: location.latitude, longitude: location.longitude)
                            }catch {
                                print("Error getting weather data \(error)")
                            }
                        }
                }
            } else {
                
                if locationManager.isLoading {
                    LoadingView()
                }
                else {
                    WelcomeView()
                        .environmentObject(locationManager)
                }
            }
            
        }
        .background(Color(hue: 0.656, saturation: 0.787, brightness: 0.354))
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
