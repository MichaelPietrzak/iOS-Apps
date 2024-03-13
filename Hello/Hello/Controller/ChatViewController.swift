//
//  ChatViewController.swift
//  Hello
//
//  Created by Michal Pietrzak on 02/03/2024.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class ChatViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var messageTextField: UITextField!
    
    let db = Firestore.firestore()
    
    var messages: [Message] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    func loadMessage() {
        db.collection(FStore.collectionName).order(by: FStore.dateField).addSnapshotListener { (querySnapshot, error) in
            self.messages = []
            if let e = error {
                print("Issue retrieving data from Firestore, \(e) ")
            } else {
                if let snapshotDocuments = querySnapshot?.documents {
                    for doc in snapshotDocuments {
                        let data = doc.data()
                        if let messageSender = data[FStore.senderField] as? String, let messageBody = data[FStore.bodyField] as? String {
                            let newMessage = Message(sender: messageSender, body: messageBody)
                            self.messages.append(newMessage)
                            
                            DispatchQueue.main.async {
                                self.tableView.reloadData()
                                let indexPath = IndexPath(row: self.messages.count - 1, section: 0)
                                self.tableView.scrollToRow(at: indexPath, at: .top, animated: false)
                            }
                        }
                    }
                }
            }
        }
    }
    
    @IBAction func sendPressed(_ sender: UIButton) {
        if let messageBody = messageTextField.text, let messageSender = Auth.auth().currentUser?.email {
            db.collection(FStore.collectionName).addDocument(data: [
                FStore.senderField: messageSender,
                FStore.bodyField: messageBody,
                FStore.dateField: Date().timeIntervalSince1970
            ]) { error in
                if let e = error {
                    print("Issue saving data to Firestore, \(e)")
                } else {
                    print("Successfully saved data.")
                }
            }
        }
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
        tableView.dataSource = self
        tableView.register(UINib(nibName: Labels.cellNibName, bundle: nil), forCellReuseIdentifier: Labels.cellIdentifier)
        loadMessage()
        title = Labels.appName
        navigationItem.hidesBackButton = true
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.font: UIFont(name: Fonts.sfProRoundedBold, size: 20)!]
    }
}

extension ChatViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messages.count
    }
 
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let message = messages[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Labels.cellIdentifier, for: indexPath) as! MessageCell
        cell.messageLabel.text = "\(message.body)"
        
        if message.sender == Auth.auth().currentUser?.email {
            cell.leftImageView.isHidden = true
            cell.rightImageView.isHidden = false
            cell.messageBubble.backgroundColor = .tintColor
        } else {
            cell.leftImageView.isHidden = false
            cell.rightImageView.isHidden = true
            cell.messageBubble.backgroundColor = .systemGray4
        }
        
        
        return cell
    }
}
