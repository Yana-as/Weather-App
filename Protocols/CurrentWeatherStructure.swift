//
//  CurrentWeatherProtocol.swift
//  Weather Map
//
//  Created by Yana on 14.09.2020.
//

import Foundation

protocol UpdateInterface {
    
    func updateInterfaceWith(weather: CurrentWeather)
}

protocol CurrentWeatherRequiredVariables {
    
    var currentTemperatureString: String { get }
    var maxTemperatureString: String { get }
    var minTemperatureString: String { get }
    var feelsLikeTemperatureString: String { get }
    var imageWeatherNameString: String { get }
    var pressureString: String { get }
    var sunsetString: String { get }
    var sunriseString: String { get }
    var humidityString: String { get }
    
    func unixTimeConvertion(unixTime: Double) -> String
}

protocol CityNames {
    
    
}

