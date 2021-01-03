//
//  jobsTableViewCell.swift
//  Smart Expence Tracker
//
//  Created by Robert Tratseuski on 1/3/21.
//

import UIKit

class jobsTableViewCell: UITableViewCell {

    @IBOutlet weak var jobName: UILabel!
    @IBOutlet weak var jobSalary: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
