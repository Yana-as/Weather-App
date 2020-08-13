//
//  CurrentWeather.swift
//  Weather Map
//
//  Created by Yana on 13.08.2020.
//

import Foundation

struct CurrentWeather {
    
    let cityName: String
    
    let currentTemperature: Double
    var currentTemperatureString: String {
        return ("\(currentTemperature.rounded())")
    }
    
    let maxTemperature: Double
    var maxTemperatureString: String {
        return ("\(maxTemperature.rounded())")
    }
    
    let minTemperature: Double
    var minTemperatureString: String {
        return ("\(minTemperature.rounded())")
    }
    
    let feelsLikeTemperature: Double
    var feelsLikeTemperatureString: String {
        return ("\(feelsLikeTemperature.rounded())")
    }
    
    let conditionCode: Int
    
    let pressure: Int
    var pressureString: String {
        return ("\(pressure)")
    }
    
    let sunset: Int
    var sunsetString: String {
        return ("\(sunset)")
    }
    
    let sunrise: Int
    var sunriseString: String {
        return ("\(sunrise)")
    }
    
    let humidity: Int
    var humidityString: String {
        return ("\(humidity)")
    }
    
    init?(currentWeatherData: CurrentWeatherData) {
        cityName = currentWeatherData.name
        currentTemperature = currentWeatherData.main.temp
        minTemperature = currentWeatherData.main.temp_min
        maxTemperature = currentWeatherData.main.temp_max
        feelsLikeTemperature = currentWeatherData.main.feels_like
        conditionCode = currentWeatherData.weather.first!.id
        pressure = currentWeatherData.main.pressure
        humidity = currentWeatherData.main.humidity
        sunrise = currentWeatherData.sys.sunrise
        sunset = currentWeatherData.sys.sunset
    }
}
