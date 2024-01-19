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
    var numOfPeople: String?
    var tipPercentage: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        layoutUI()
        updateUI()
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        self.dismiss(animated: true, completion: nil)
    }
    
    func updateUI() {
        totalValueLbl.text = calcResult
        settingsLbl.text = "Split between \(numOfPeople!) people, with \(tipPercentage!)% tip."
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
    }
}
