//
//  ConnectNowTableViewCell.swift
//  INIT Center
//
//  Created by Shashidhar Jagatap on 01/02/17.
//  Copyright © 2017 Shashidhar Jagatap. All rights reserved.
//

import UIKit

class ConnectNowTableViewCell: UITableViewCell {

    @IBOutlet var connectNowBtn: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        connectNowBtn.layer.cornerRadius = 4.0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
