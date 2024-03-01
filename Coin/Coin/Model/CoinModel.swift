//
//  CoinModel.swift
//  Coin
//
//  Created by Michal Pietrzak on 01/03/2024.
//

import Foundation

struct CoinModel {
    let lastPrice: Double
    
    var lastPriceString: String {
        String(format: "%.2f", lastPrice)
    }
}
