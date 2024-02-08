//
//  WeatherManager.swift
//  Weather
//
//  Created by Michal Pietrzak on 07/02/2024.
//

import Foundation

struct WeatherManager {
    
    let secureAPIkey = ProcessInfo.processInfo.environment["WEATHER_API_KEY"] ?? "API Key error!"
    let weatherURL = "https://api.openweathermap.org/data/2.5/weather?&appid="
    let units = "&units=metric"
    
    func fetchWeather(cityName: String) {
        let urlString = "\(weatherURL)\(secureAPIkey)&q=\(cityName)\(units)"
        print(urlString)
    }
}
