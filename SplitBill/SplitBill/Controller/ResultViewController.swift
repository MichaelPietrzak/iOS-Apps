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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        
    }
    
    func updateUI() {
        
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
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
