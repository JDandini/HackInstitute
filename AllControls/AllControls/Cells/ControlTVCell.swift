//
//  ControlTVCell.swift
//  AllControls
//
//  Created by F J Castañeda Ramos on 10/7/16.
//  Copyright © 2016 HackInstitute. All rights reserved.
//

import UIKit
import MSCellAccessory

class ControlTVCell: UITableViewCell {

    @IBOutlet weak var ivControlIcon:UIImageView!
    @IBOutlet weak var lblControlName:UILabel!
    @IBOutlet weak var lblControlSubtitle:UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.accessoryView = MSCellAccessory(type: FLAT_DISCLOSURE_INDICATOR, color: UIColor.brightPink())
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
