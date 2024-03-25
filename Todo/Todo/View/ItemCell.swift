//
//  ItemCell.swift
//  Todo
//
//  Created by Michal Pietrzak on 25/03/2024.
//

import UIKit

class ItemCell: UITableViewCell {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var checkmarkImage: UIImageView!
    @IBOutlet var cellView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configure()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func configure() {
        checkmarkImage.isHidden = true
        cellView.layer.cornerRadius = 9
    }
}
