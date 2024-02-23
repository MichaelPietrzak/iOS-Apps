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
        performRequest(urlString: urlString)
    }
    
    func performRequest(urlString: String) {
        if let url = URL(string: urlString) {
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, responnse, error) in
                if error != nil {
                    print(error!)
                    return
                }
                if let safeData = data {
                    parseJSON(weatherData: safeData)
                }
            }
            task.resume()
        }
    }
    
    func parseJSON(weatherData: Data) {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(WeatherData.self, from: weatherData)
            let id = decodedData.weather[0].id
            print(getConditionName(weatherId: id))
        } catch {
            print(error)
        }
    }
    
    func getConditionName(weatherId: Int) -> String {
        switch weatherId {
        case 200...232:
            return "cloud.bolt.rain"
        case 300...321:
            return "cloud.drizzle"
        case 500...531:
            return "cloud.rain"
        case 600...622:
            return "cloud.snow"
        case 701...781:
            return "cloud.fog"
        case 800:
            return "sun.max"
        case 801...804:
           return "cloud"
        default:
            return "cloud.sun"
        }
    }
}
