//
//  PendingTableViewCell.swift
//  Application
//
//  Created by Berkehan on 29.11.2021.
//

import UIKit
import Service
class PendingTableViewCell: UITableViewCell, NibLoadableView, ReusableView {

    @IBOutlet weak var bubbleView: UIView!
    @IBOutlet weak var dreamImageView: UIImageView!
    @IBOutlet weak var dreamTopicLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.backgroundColor = .clear
        self.selectionStyle = .none

        bubbleView.layer.cornerRadius = bubbleView.frame.width * 0.1
        bubbleView.layer.borderWidth = 0.5
        bubbleView.layer.borderColor = UIColor.systemBlue.cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(dream: Dream) {
        dreamTopicLabel.text = dream.dreamTopic
    }
    
}
