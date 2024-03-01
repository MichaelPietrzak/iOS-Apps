//
//  CoinManager.swift
//  Coin
//
//  Created by Michal Pietrzak on 28/02/2024.
//

import Foundation

struct CoinManager {
    
    let secureAPIKey = ProcessInfo.processInfo.environment["YOUR_API_KEY"] ?? "Invalid API Key"
    let coinURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    
    func getCoinPrice(for currency: String) {
        print(currency)
    }
}
