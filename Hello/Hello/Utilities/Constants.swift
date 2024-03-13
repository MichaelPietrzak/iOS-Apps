//
//  Constants.swift
//  Hello
//
//  Created by Michal Pietrzak on 12/03/2024.
//

import Foundation
import UIKit

enum Labels {
    static let appName        = "Hello 💬"
    static let chatVC         = "ChatViewController"
    static let cellIdentifier = "ReusableCell"
    static let cellNibName    = "MessageCell"
}

enum Fonts {
    static let sfProRoundedBold  = "SFProRounded-Bold"
}

enum FStore {
    static let collectionName = "messages"
    static let senderField    = "sender"
    static let bodyField      = "body"
    static let dateField      = "date"
}
