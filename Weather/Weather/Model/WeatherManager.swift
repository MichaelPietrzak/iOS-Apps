//
//  WeatherManager.swift
//  Weather
//
//  Created by Michal Pietrzak on 07/02/2024.
//

import Foundation

struct WeatherManager {
    
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?&appid=54fa1a5792aa767a19f7858212a53bb7&units=metric"
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)&q=\(cityName)"
        print(urlString)
    }
}
