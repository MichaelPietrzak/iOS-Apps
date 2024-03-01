//
//  CoinManager.swift
//  Coin
//
//  Created by Michal Pietrzak on 28/02/2024.
//

import Foundation

protocol CoinManagerDelegate {
    func didUpdateCoinPrice(_ coinManager: CoinManager, coinPrice: CoinModel, currency: String)
    func didFailWithError(error: Error)
}

struct CoinManager {
    
    let secureAPIKey = ProcessInfo.processInfo.environment["YOUR_API_KEY"] ?? "Invalid API Key"
    let coinURL = "https://rest.coinapi.io/v1/exchangerate/BTC"
    
    let currencyArray = ["AUD", "BRL","CAD","CNY","EUR","GBP","HKD","IDR","ILS","INR","JPY","MXN","NOK","NZD","PLN","RON","RUB","SEK","SGD","USD","ZAR"]
    var selectedCurrency = ""
    
    var delegate: CoinManagerDelegate?
    
    mutating func fetchCoinPrice(for currency: String) {
        let urlString = "\(coinURL)/\(currency)?apikey=\(secureAPIKey)"
        selectedCurrency = currency
        performRequest(with: urlString)
    }
    
    func performRequest(with urlString: String) {
        DispatchQueue.global(qos: .userInitiated).sync {
            if let url = URL(string: urlString) {
                let session = URLSession(configuration: .default)
                let task = session.dataTask(with: url) { data, response, error in
                    if error != nil {
                        delegate?.didFailWithError(error: error!)
                        return
                    }
                    if let safeData = data {
                        if let coinPrice = parseJSON(safeData) {
                            delegate?.didUpdateCoinPrice(self, coinPrice: coinPrice, currency: selectedCurrency)
                        }
                    }
                }
                task.resume()
            }
        }
    }
    
    func parseJSON(_ coinData: Data) -> CoinModel? {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(CoinData.self, from: coinData)
            let rate = decodedData.rate
            
            let lastPrice = CoinModel(lastPrice: rate)
            return lastPrice
            
        } catch {
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}
