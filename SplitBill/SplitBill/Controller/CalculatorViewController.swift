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
    @IBOutlet weak var splitStepperBtn: UIStepper!
    @IBOutlet weak var calculateBtn: UIButton!
    @IBOutlet weak var blankView: UIView!
    
    var calculatorModel = CalculatorModel()
    
    var tipAmount = ""
    var tipPercent: Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutUI()
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        tipAmount = sender.titleLabel?.text ?? "Error"
        print("TipAmount: \(tipAmount)")
        zeroPctBtn.isSelected = false
        tenPctBtn.isSelected = false
        TwentyPctBtn.isSelected = false
        
        sender.isSelected = true
        
        billTextField.endEditing(true)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        splitNumberLbl.text = String(format: "%.f", sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        tipPercent = (tipAmount as NSString).doubleValue / 100
        print("Tip: \(tipPercent)")
        
        let userInput = billTextField.text ?? "Error"
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.decimalSeparator = ","
        let decimalFormat = formatter.number(from: userInput) ?? 0.0
        let inputValue = Double(truncating: decimalFormat)
        print("User value: \(inputValue)")
        
        let split = splitStepperBtn.value
        
        calculatorModel.calculateBill(value: inputValue, split: split, tip: tipPercent)
        self.performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultViewController
            destinationVC.calcResult = calculatorModel.getValue()
            destinationVC.numOfPeople = calculatorModel.getSplit()
            destinationVC.tipPercentage = calculatorModel.getTip()
        }
    }
    
    func layoutUI() {
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
        
        calculateBtn.layer.cornerRadius  = 5
        billTextField.layer.cornerRadius = 5
        
        billTextField.borderStyle = .none
        
        billTextField.attributedPlaceholder = NSAttributedString(
            string: "e.g. 45.67",
            attributes: [NSAttributedString.Key.foregroundColor: Colors.darkGray]
        )
    }
}
