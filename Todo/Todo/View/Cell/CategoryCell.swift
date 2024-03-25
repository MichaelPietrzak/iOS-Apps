//
//  CategoryCell.swift
//  Todo
//
//  Created by Michal Pietrzak on 25/03/2024.
//

import UIKit

class CategoryCell: UITableViewCell {

    @IBOutlet var titleLabel: UILabel!
    @IBOutlet var cellView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configure()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    func configure() {
        cellView.layer.cornerRadius = 9
    }
}
