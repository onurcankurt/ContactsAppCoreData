//
//  PersonCell.swift
//  ContactsAppCoreData
//
//  Created by onur on 12.05.2024.
//

import UIKit

class PersonCell: UITableViewCell {
    
    @IBOutlet weak var cellNameLabel: UILabel!
    @IBOutlet weak var cellPhoneLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
