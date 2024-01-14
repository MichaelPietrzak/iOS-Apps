//
//  ViewController.swift
//  SplitBill
//
//  Created by Michal Pietrzak on 09/01/2024.
//

import UIKit

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTotalLbl: UILabel!
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var selectTipLbl: UILabel!
    @IBOutlet weak var zeroPctBtn: UIButton!
    @IBOutlet weak var tenPctBtn: UIButton!
    @IBOutlet weak var TwentyPctBtn: UIButton!
    @IBOutlet weak var splitLbl: UILabel!
    @IBOutlet weak var splitNumberLbl: UILabel!
    @IBOutlet weak var calculateBtn: UIButton!
    @IBOutlet weak var blankView: UIView!
    
    var tipAmount = ""
    var splitValue = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        tipAmount = sender.titleLabel?.text ?? "No tip"
        
        zeroPctBtn.isSelected = false
        tenPctBtn.isSelected = false
        TwentyPctBtn.isSelected = false
        
        sender.isSelected = true
        
        billTextField.endEditing(true)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitValue = String(format: "%.f", sender.value)
        splitNumberLbl.text = splitValue
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        let tipValue = (tipAmount as NSString).doubleValue / 100
        
        let userInput = billTextField.text ?? "Non entered"
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.decimalSeparator = ","
        let decimalFormat = formatter.number(from: userInput) ?? 0.0
        let inputValue = Double(decimalFormat)
        
        let split = (splitValue as NSString).doubleValue

        let totalToPay = ((inputValue * tipValue) + inputValue) / split
        let twoDecimalPlaces = String(format: "%.2f", totalToPay)
        print(twoDecimalPlaces)
    }
    
    func updateUI() {
        
        view.backgroundColor       = Colors.lightGray
        blankView.backgroundColor  = Colors.lightGray
        
        billTotalLbl.textColor       = Colors.black
        billTextField.textColor      = Colors.darkBlue
        selectTipLbl.textColor       = Colors.black
        splitLbl.textColor           = Colors.black
        splitNumberLbl.textColor     = Colors.darkBlue
        zeroPctBtn.tintColor         = Colors.darkBlue
        tenPctBtn.tintColor          = Colors.darkBlue
        TwentyPctBtn.tintColor       = Colors.darkBlue
        calculateBtn.tintColor       = Colors.lightGray
        calculateBtn.backgroundColor = Colors.darkBlue
        
        billTotalLbl.font             = UIFont(name: Fonts.sfProRoundedBold, size: 20)
        selectTipLbl.font             = UIFont(name: Fonts.sfProRoundedBold, size: 20)
        splitLbl.font                 = UIFont(name: Fonts.sfProRoundedBold, size: 20)
        billTextField.font            = UIFont(name: Fonts.sfProRoundedBold, size: 17)
        splitNumberLbl.font           = UIFont(name: Fonts.sfProRoundedBold, size: 17)
        zeroPctBtn.titleLabel?.font   = UIFont(name: Fonts.sfProRoundedBold, size: 17)
        tenPctBtn.titleLabel?.font    = UIFont(name: Fonts.sfProRoundedBold, size: 17)
        TwentyPctBtn.titleLabel?.font = UIFont(name: Fonts.sfProRoundedBold, size: 17)
        calculateBtn.titleLabel?.font = UIFont(name: Fonts.sfProRoundedBold, size: 20)
        
        billTextField.layer.cornerRadius = 5
        calculateBtn.layer.cornerRadius  = 5
        
        billTextField.borderStyle = .none
        billTextField.placeholder = "e.g. 45.67"
    }
}