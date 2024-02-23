//
//  WeatherData.swift
//  Weather
//
//  Created by Michal Pietrzak on 16/02/2024.
//

import Foundation

struct WeatherData: Codable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Codable {
    let temp: Double
}

struct Weather: Codable {
    let id: Int
}
