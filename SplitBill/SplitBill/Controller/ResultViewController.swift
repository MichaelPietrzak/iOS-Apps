//
//  ResultViewController.swift
//  SplitBill
//
//  Created by Michal Pietrzak on 10/01/2024.
//

import UIKit

class ResultViewController: UIViewController {

    @IBOutlet weak var totalLbl: UILabel!
    @IBOutlet weak var totalValueLbl: UILabel!
    @IBOutlet weak var settingsLbl: UILabel!
    @IBOutlet weak var recalculateBtn: UIButton!
    
    var calcResult: String?
    var numOfPeople: Double?
    var tipPercentage: Double?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutUI()
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func layoutUI() {
        view.backgroundColor = Colors.lightGray
        
        totalLbl.textColor             = Colors.black
        totalValueLbl.textColor        = Colors.darkBlue
        settingsLbl.textColor          = Colors.black
        recalculateBtn.tintColor       = Colors.lightGray
        recalculateBtn.backgroundColor = Colors.darkBlue
        
        totalLbl.font                   = UIFont(name: Fonts.sfProRoundedBold, size: 20)
        totalValueLbl.font              = UIFont(name: Fonts.sfProRoundedBold, size: 35)
        settingsLbl.font                = UIFont(name: Fonts.sfProRoundedBold, size: 20)
        recalculateBtn.titleLabel?.font = UIFont(name: Fonts.sfProRoundedBold, size: 20)
        
        recalculateBtn.layer.cornerRadius = 5
        
        totalValueLbl.text = calcResult
        settingsLbl.text = "Split between \(Int(numOfPeople!)) people, with \(Int(tipPercentage! * 100))% tip."
    }
}
