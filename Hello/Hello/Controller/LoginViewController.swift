//
//  LoginViewController.swift
//  Hello
//
//  Created by Michal Pietrzak on 02/03/2024.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func signInPressed(_ sender: UIButton) {
        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
                if let e = error {
                    self.errorLabel.text = e.localizedDescription
                } else {
                    if let chatVC = self.storyboard?.instantiateViewController(withIdentifier: Labels.chatVC) {
                        self.navigationController?.pushViewController(chatVC, animated: true)
                    }
                }
            }
        }
    }
}
