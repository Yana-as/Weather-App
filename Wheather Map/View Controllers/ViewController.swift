//
//  ViewController.swift
//  Wheather Map
//
//  Created by Yana on 11.08.2020.
//

import UIKit

class ViewController: UIViewController{

    var networkWeatherManager = NetworkWeatherManager()
    
    @IBOutlet weak var searchButton: UIButton!
    @IBOutlet weak var customCitySearchTextField: UITextField!
    @IBOutlet weak var wheatherImage: UIImageView!
    @IBOutlet weak var currentTemperatureLabel: UILabel!
    @IBOutlet weak var currentCityLabel: UILabel!
    @IBOutlet weak var maxTemperatureLabel: UILabel!
    @IBOutlet weak var minTemperatureLabel: UILabel!
    @IBOutlet weak var humidityLabel: UILabel!
    @IBOutlet weak var feelsLikeLabel: UILabel!
    @IBOutlet weak var pressureLabel: UILabel!
    @IBOutlet weak var sunriseLabel: UILabel!
    @IBOutlet weak var sunsetLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchButton.layer.cornerRadius = 5
        searchButton.clipsToBounds = true

        networkWeatherManager.delegate = self
        networkWeatherManager.fetchCurrentWeather(forCity: "London")
        
        self.customCitySearchTextField.delegate = self
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tapGesture))
        view.addGestureRecognizer(tapGesture)
    }

    @IBAction func searchButtonPressed(_ sender: UIButton) {
        
        guard let city = customCitySearchTextField.text else { return }
        let customCity = city.split(separator: " ").joined(separator: "%20")
        customCitySearchTextField.text = ""
        
        networkWeatherManager.fetchCurrentWeather(forCity: customCity)
        textFieldShouldReturn(customCitySearchTextField)
    }
}

extension ViewController: NetworkWeatherManagerDelegate {
    func updateInterface(_: NetworkWeatherManager, with currentWeather: CurrentWeather) {
        print(currentWeather.cityName)
    }
}


