//
//  WeatherManager.swift
//  WeatherApp
//
//  Created by Chethan J on 26/12/2022.
//

import Foundation
import CoreLocation

class WeatherManager {
    
    func getWeatherOfCurrentLocation(latitude: CLLocationDegrees, longitude: CLLocationDegrees) async throws -> WeatherModel {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?lat=\(latitude)&lon=\(longitude)&appid=48532a5e16bd27acbb55cf0c9b778afc&units=metric") else {
            fatalError("missing url")
        }
        
        let urlRequest = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            fatalError("Error fetching weather data")
        }
        
        let decodedData = try JSONDecoder().decode(WeatherModel.self, from: data)
        
        return decodedData
    }
    
    
    func getWeatherForCity(cityName:String) async throws -> WeatherModel {
        guard let url = URL(string: "https://api.openweathermap.org/data/2.5/weather?q=\(cityName)&appid=2b8ea515dfa57755bf9bf822919ffe94") else {
            fatalError("missing url")
        }
        
        let urlRequest = URLRequest(url: url)
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        
        guard (response as? HTTPURLResponse)?.statusCode == 200 else {
            fatalError("Error fetching weather data")
        }
        
        let decodedData = try JSONDecoder().decode(WeatherModel.self, from: data)
        
        return decodedData
    }
}
