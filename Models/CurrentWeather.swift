//
//  CurrentWeather.swift
//  Weather Map
//
//  Created by Yana on 13.08.2020.
//

import Foundation

struct CurrentWeather: CurrentWeatherRequiredVariables {
    
    let cityName: String
    
    let currentTemperature: Double
    var currentTemperatureString: String {
        return String(format: "%.0f", currentTemperature)
    }
    
    let maxTemperature: Double
    var maxTemperatureString: String {
        return String(format: "%.0f", maxTemperature)
    }
    
    let minTemperature: Double
    var minTemperatureString: String {
        return String(format: "%.0f", minTemperature)
    }
    
    let feelsLikeTemperature: Double
    var feelsLikeTemperatureString: String {
        return String(format: "%.0f", feelsLikeTemperature)
    }
    
    let conditionCode: Int
    var imageWeatherNameString: String{
        switch conditionCode {
        case 200...232: return "bolt"
        case 300...321, 500...531: return "rain"
        case 600...622: return "snow"
        case 701...781: return "fog"
        case 800: return "clear"
        case 801...804: return "cloudy"
        default: return "clear"
        }
    }
    
    let pressure: Int
    var pressureString: String {
        return ("\(pressure)")
    }
    
    let sunset: Double
    var sunsetString: String {
        unixTimeConvertion(unixTime: sunset)
    }
    
    let sunrise: Double
    var sunriseString: String {
        unixTimeConvertion(unixTime: sunrise)
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
    
    func unixTimeConvertion(unixTime: Double) -> String {
        let time = NSDate(timeIntervalSince1970: unixTime)
        let dateFormatter = DateFormatter()
        //dateFormatter.timeZone = NSTimeZone(name: timeZoneInfo)
        dateFormatter.locale = NSLocale(localeIdentifier: NSLocale.system.identifier) as Locale?
        dateFormatter.dateFormat = "hh:mm a"
        let dateAsString = dateFormatter.string(from: time as Date)
        dateFormatter.dateFormat = "h:mm a"
        let date = dateFormatter.date(from: dateAsString)
        dateFormatter.dateFormat = "HH:mm"
        let date24 = dateFormatter.string(from: date!)
        return date24
    }
}
