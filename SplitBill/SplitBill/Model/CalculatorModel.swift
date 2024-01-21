//
//  CalculatorModel.swift
//  SplitBill
//
//  Created by Michal Pietrzak on 19/01/2024.
//

import Foundation

struct CalculatorModel {
    
    var bill: Bill?
    var tipDecimal = 0.0
    
    mutating func calculateBill(value: Double, split: Double, tip: Double) {
        let billValue = ((value * tip) + value) / split
        
        bill = Bill(value: billValue, split: split, tip: tip)
    }
    
    func getValue() -> String {
        String(format: "%.2f", bill?.value ?? 0.0)
    }
    
    func getSplit() -> String {
        String(format: "%.f", bill?.split ?? 0.0)
    }
    
    func getTip() -> String {
        let percentValue = (bill?.tip ?? 0.0) * 100
        return String(format: "%.f", percentValue)
    }
    
    mutating func getTipSelect(_ value: String) {
        tipDecimal = (value as NSString).doubleValue / 100
    }
    
    func formatInputTextField(_ input: String) -> Double {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.decimalSeparator = ","
        let decimalFormat = formatter.number(from: input) ?? 0.0
        let value = Double(truncating: decimalFormat)
        return value
    }
}
