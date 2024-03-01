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
    
    func fetchCoinPrice(for currency: String) {
        let urlString = "\(coinURL)/\(currency)?apikey=\(secureAPIKey)"
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String) {
        DispatchQueue.global(qos: .userInitiated).sync {
            if let url = URL(string: urlString) {
                let session = URLSession(configuration: .default)
                let task = session.dataTask(with: url) { data, response, error in
                    if error != nil {
                        print(error!)
                    }
                    if let safeData = data {
//                        print(String(data: safeData, encoding: .utf8)!)
                        print(parseJSON(safeData))
                    }
                }
                task.resume()
            }
        }
    }
    
    func parseJSON(_ coinData: Data) {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(CoinData.self, from: coinData)
            let rate = decodedData.rate
            print(rate)
            
        } catch {
            print(error)
        }
    }
}
