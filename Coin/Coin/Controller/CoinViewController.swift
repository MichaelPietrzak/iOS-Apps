//
//  ViewController.swift
//  Coin
//
//  Created by Michal Pietrzak on 27/02/2024.
//

import UIKit

class CoinViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate, CoinManagerDelegate {
    
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
    
    func didUpdateCoinPrice(_ coinManager: CoinManager, coinPrice: CoinModel, currency: String) {
        
    }
    
    func didFailWithError(error: Error) {
        
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coinManager.currencyArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        coinManager.currencyArray[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        coinManager.fetchCoinPrice(for: coinManager.currencyArray[row])
    }
    
    func layoutUI() {
        priceView.layer.cornerRadius = 10
    }
}
