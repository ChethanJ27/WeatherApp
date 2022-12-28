//
//  WeatherModel.swift
//  WeatherApp
//
//  Created by Chethan J on 26/12/2022.
//

import Foundation


struct WeatherModel: Codable, Identifiable {
    let coord: CoOrdinates
    let weather: [Weather]
    let main: WeatherDetails
    let name: String?
    let timezone: Int?
    let wind: Wind
    let id: Int?
    
}

struct Weather: Codable {
    let id: Int?
    let main: String?
    let description: String?
    let icon: String?
}

struct Wind: Codable{
    let speed: Double?
    let deg: Int?
    let gust: Double?
}

struct WeatherDetails: Codable {
    let temp: Double?
    let feels_like: Double?
    let temp_min: Double?
    let temp_max: Double?
    let pressure: Int?
    let humidity: Int?
    let sea_level: Int?
    let grnd_level: Int?
}

struct CoOrdinates: Codable {
    let lat: Double?
    let lon: Double?
}
