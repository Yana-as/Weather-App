//
//  ViewController.swift
//  Wheather Map
//
//  Created by Yana on 11.08.2020.
//

import UIKit
import CoreLocation

class ViewController: UIViewController, UpdateInterface {
    
    var networkWheatherManager = NetworkWeatherManager()
    var localJsonParser = LocalJsonParser()
    
    lazy var locationManager: CLLocationManager = {
        let lm = CLLocationManager()
        lm.delegate = self
        lm.desiredAccuracy =  kCLLocationAccuracyKilometer
        lm.requestWhenInUseAuthorization() 
        return lm
    }()
    @IBOutlet weak var searchResultsTableView: UITableView!
    
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
       
        networkWheatherManager.onCompletion = { [weak self] currentWeather in
            guard let self = self else { return }
            self.updateInterfaceWith(weather: currentWeather)
        }
        
        if CLLocationManager.locationServicesEnabled() {
            locationManager.requestLocation()
        }
        
        self.customCitySearchTextField.delegate = self
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(self.tapGesture))
        view.addGestureRecognizer(tapGesture)
        
        searchResultsTableView.layer.cornerRadius = 5
        searchResultsTableView.dataSource = self
        
        localJsonParser.getData()
    }

    func updateInterfaceWith(weather: CurrentWeather) {
        DispatchQueue.main.async {
            self.currentCityLabel.text = weather.cityName
            self.currentTemperatureLabel.text = weather.currentTemperatureString
            self.maxTemperatureLabel.text = weather.maxTemperatureString + "°C"
            self.minTemperatureLabel.text = weather.minTemperatureString + "°C"
            self.humidityLabel.text = weather.humidityString + "%"
            self.feelsLikeLabel.text = weather.feelsLikeTemperatureString + "°C"
            self.pressureLabel.text = weather.pressureString + " hPa"
            self.sunsetLabel.text = weather.sunsetString
            self.sunriseLabel.text = weather.sunriseString
            self.wheatherImage.image = UIImage(named: weather.imageWeatherNameString)
        }
    }
    
    @IBAction func searchButtonPressed(_ sender: UIButton) {
        
        guard let city = customCitySearchTextField.text else { return }
        let customCity = city.split(separator: " ").joined(separator: "%20")
        customCitySearchTextField.text = ""
        
        networkWheatherManager.fetchCurrentWeather(forRequestType: .cityName(city: customCity))
        textFieldShouldReturn(customCitySearchTextField)
    }
}

// MARK: CLLocationManagerDelegate
extension ViewController: CLLocationManagerDelegate {
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        guard let location = locations.last else { return }
        let latitude = location.coordinate.latitude
        let longitude = location.coordinate.longitude
        
        networkWheatherManager.fetchCurrentWeather(forRequestType: .coordinates(latitude: latitude, longitude: longitude))
    }
    
    func locationManager(_ manager: CLLocationManager, didFailWithError error: Error) {
        print(error.localizedDescription)
    }
}

// MARK: TableView Data Source
extension ViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.searchResultsTableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! SearchCityTableViewCell
        
        cell.cityNameLabel.text = "City name"
        return cell
    }
}
