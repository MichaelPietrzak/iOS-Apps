//
//  ChatViewController.swift
//  Hello
//
//  Created by Michal Pietrzak on 02/03/2024.
//

import UIKit
import FirebaseAuth

class ChatViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextField: UITextField!
    
    var messages: [Message] = [
        Message(sender: "1@2.com", body: "Hey!"),
        Message(sender: "a@b.com", body: "Hello!"),
        Message(sender: "1@2.com", body: "What's up!")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    @IBAction func sendPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func signOutPressed(_ sender: UIBarButtonItem) {
        do {
            try Auth.auth().signOut()
            navigationController?.popToRootViewController(animated: true)
            
        } catch let signOutError as NSError {
          print("Error signing out: %@", signOutError)
        }
    }
    
    func configure() {
        title = Labels.appName
        navigationItem.hidesBackButton = true
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: Fonts.sfProRoundedBold, size: 20)!]
    }
}

