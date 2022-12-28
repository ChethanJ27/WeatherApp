//
//  WeatherSearchBar.swift
//  WeatherApp
//
//  Created by Chethan J on 27/12/2022.
//

import SwiftUI

struct WeatherSearchBar: View {
    @State private var city: String = ""
    @State var weather: WeatherModel?
    var weatherManager = WeatherManager()
    
    var body: some View {
            VStack(alignment: .leading, spacing: 10){
                TextField(
                    "Enter the city name to check Weather",
                    text: $city
                )
                .padding()
                .overlay(RoundedRectangle(cornerRadius: 10.0).strokeBorder(Color.white, style: StrokeStyle(lineWidth: 1.0)))
                .textInputAutocapitalization(.never)
                .bold()
                .disableAutocorrection(true)
                .onSubmit {
                    Task {
                        let data = await self.fetchWeatherForCity(name: city)
                        weather = data
                    }
                }
            }
            .foregroundColor(.white)
            .sheet(item: $weather) {weath in
                WeatherView(weather: weath)
            }
        }

    
    func fetchWeatherForCity(name:String) async -> WeatherModel {
        do {
            let weatherModel = try await weatherManager.getWeatherForCity(cityName: city)
            return weatherModel
        } catch {
            print(error)
            fatalError("error occurred while fetching city weather \(error)")
        }
    }
}

struct WeatherSearchBar_Previews: PreviewProvider {
    static var previews: some View {
        WeatherSearchBar()
    }
}
