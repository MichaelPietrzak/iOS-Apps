//
//  ViewController.swift
//  Weather
//
//  Created by Michal Pietrzak on 25/01/2024.
//

import UIKit

class WeatherViewController: UIViewController, UISearchBarDelegate {

    @IBOutlet weak var cityLbl: UILabel!
    @IBOutlet weak var temperatureLbl: UILabel!
    @IBOutlet weak var conditionImageView: UIImageView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
           searchBar.endEditing(true)
       }
}

