//
//  ViewController.swift
//  Coin
//
//  Created by Michal Pietrzak on 27/02/2024.
//

import UIKit

class CoinViewController: UIViewController {
    
    @IBOutlet weak var priceView: UIView!
    @IBOutlet weak var currencyPicker: UIPickerView!
    @IBOutlet weak var currencyLbl: UILabel!
    @IBOutlet weak var coinLbl: UILabel!
    
    var coinManager = CoinManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        currencyPicker.dataSource = self
        currencyPicker.delegate = self
        coinManager.delegate = self
        
        layoutUI()
    }
    
    func layoutUI() {
        priceView.layer.cornerRadius = 10
    }
}

extension CoinViewController: CoinManagerDelegate {
    func didUpdateCoinPrice(_ coinManager: CoinManager, coinPrice: CoinModel, currency: String) {
        DispatchQueue.main.async {
            self.coinLbl.text = "\(coinPrice.lastPriceString)"
            self.currencyLbl.text = currency
        }
    }
    
    func didFailWithError(error: Error) {
        print(error)
    }
}

extension CoinViewController: UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinManager.currencyArray.count
    }
}

extension CoinViewController: UIPickerViewDelegate {
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        coinManager.currencyArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        coinManager.fetchCoinPrice(for: coinManager.currencyArray[row])
    }
}
