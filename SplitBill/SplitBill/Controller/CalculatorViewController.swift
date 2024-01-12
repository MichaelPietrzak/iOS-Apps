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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @IBAction func tipChanged(_ sender: UIButton) {
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
    }
    
    func updateUI() {
        
        view.backgroundColor = Colors.lightGray
        
        billTotalLbl.textColor  = Colors.black
        billTextField.textColor = Colors.darkBlue
        selectTipLbl.textColor  = Colors.black
        splitLbl.textColor      = Colors.black
        splitNumberLbl.textColor = Colors.darkBlue
        
        billTotalLbl.font   = UIFont(name: Fonts.sfProRoundedBold, size: 20)
        selectTipLbl.font   = UIFont(name: Fonts.sfProRoundedBold, size: 20)
        splitLbl.font       = UIFont(name: Fonts.sfProRoundedBold, size: 20)
        billTextField.font  = UIFont(name: Fonts.sfProRoundedBold, size: 17)
        splitNumberLbl.font = UIFont(name: Fonts.sfProRoundedBold, size: 17)
        
        billTextField.layer.cornerRadius = 5
        
    }
}
