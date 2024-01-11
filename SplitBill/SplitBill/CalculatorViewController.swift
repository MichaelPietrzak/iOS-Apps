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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}

