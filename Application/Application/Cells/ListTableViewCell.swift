//
//  ListTableViewCell.swift
//  Application
//
//  Created by Berkehan on 29.11.2021.
//

import UIKit
import Service
class ListTableViewCell: UITableViewCell, NibLoadableView, ReusableView {

    @IBOutlet weak var bubbleView: UIView!
    @IBOutlet weak var titleWordLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .clear

    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 5, left: 8, bottom: 5, right: 8))
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(word: DreamWord) {
        titleWordLabel.text = word.dreamWordTitle
    }
}
