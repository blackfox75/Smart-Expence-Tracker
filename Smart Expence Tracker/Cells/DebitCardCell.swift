//
//  DebitCardCell.swift
//  Smart Expence Tracker
//
//  Created by Robert Tratseuski on 12/31/20.
//

import UIKit

class DebitCardCell: UITableViewCell {

    @IBOutlet weak var debitCardName: UILabel!
    @IBOutlet weak var debitCardMoney: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
}
