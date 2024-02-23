//
//  ViewController.swift
//  Weather
//
//  Created by Michal Pietrzak on 25/01/2024.
//

import UIKit

class WeatherViewController: UIViewController, UISearchBarDelegate, WeatherManagerDelegate {
    
    @IBOutlet weak var cityLbl: UILabel!
    @IBOutlet weak var temperatureLbl: UILabel!
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var weatherManager = WeatherManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        weatherManager.delegate = self
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.endEditing(true)
    }
    
    func searchBarShouldEndEditing(_ searchBar: UISearchBar) -> Bool {
        if searchBar.text != "" {
            return true
        } else {
            searchBar.placeholder = "Type something..."
            return false
        }
    }
    
    func searchBarTextDidEndEditing(_ searchBar: UISearchBar) {
        if let city = searchBar.text {
            weatherManager.fetchWeather(cityName: city)
        }
        searchBar.text = ""
    }
    
    func didUpdateWeather(_ weatherManager: WeatherManager, weather: WeatherModel) {
        DispatchQueue.main.async {
            self.temperatureLbl.text = "\(weather.temperatureString)°"
            self.conditionImageView.image = UIImage(systemName: weather.conditionName)
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}

