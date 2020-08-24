//
//  CurrentWheatherData.swift
//  Wheather Map
//
//  Created by Yana on 13.08.2020.
//

import Foundation

struct CurrentWeatherData: Codable {
    let name: String
    let main: Main
    let weather: [Weather]
    let sys: Sys
}

struct Main: Codable {
    let temp: Double
    let feels_like: Double
    let temp_min: Double
    let temp_max: Double
    let pressure: Int
    let humidity: Int
}

struct Weather: Codable {
    let id: Int
}

struct Sys: Codable {
    let sunrise: Double
    let sunset: Double
}

