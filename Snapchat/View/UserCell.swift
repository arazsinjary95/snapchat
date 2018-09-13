//
//  UserCell.swift
//  Snapchat
//
//  Created by Araz Sinjary on 9/13/18.
//  Copyright © 2018 Araz Sinjary. All rights reserved.
//

import UIKit

class UserCell: UITableViewCell {

    @IBOutlet weak var firstNameLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()

        setCheckMark(selected: false)
    }

    func updateUI(user: User) {
        firstNameLbl.text = user.firstName
    }
    
    func setCheckMark(selected: Bool) {
        let imageStr = selected ? "messageindicatorchecked1" : "messageindicator1"
        self.accessoryView = UIImageView(image: UIImage(named: imageStr))
    }

}
