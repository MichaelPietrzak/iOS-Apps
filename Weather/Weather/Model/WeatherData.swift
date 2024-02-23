//
//  WeatherData.swift
//  Weather
//
//  Created by Michal Pietrzak on 16/02/2024.
//

import Foundation

struct WeatherData: Decodable {
    let name: String
    let main: Main
    let weather: [Weather]
}

struct Main: Decodable {
    let temp: Double
}

struct Weather: Decodable {
    let id: Int
}
