//
//  NetworkWheatherManager.swift
//  Wheather Map
//
//  Created by Yana on 12.08.2020.
//

import Foundation

struct NetworkWhatherManager {
    func fetchCurrentWheather (forCity city: String) {
        let urlString = "https://api.openweathermap.org/data/2.5/weather?q=\(city)&appid=\(apiKey)"
        guard let url = URL(string: urlString) else { return }
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { data, response, error in
            if let data = data {
                self.parseJSON(withData: data)
            }
        }
        task.resume()
    }
    
    func parseJSON(withData data: Data) {
        let decoder = JSONDecoder()
        do {
            let currentWheatherData = try decoder.decode(CurrentWeatherData.self, from: data)
            print(currentWheatherData.main.pressure)
        } catch let error as NSError {
            print(error.localizedDescription)
        }
    }
}
