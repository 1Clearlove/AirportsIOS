//
//  AirportTableViewCell.swift
//  Airport
//
//  Created by Mathieu Knook on 20/10/2017.
//  Copyright © 2017 Mathieu Knook. All rights reserved.
//

import UIKit

class AirportTableViewCell: UITableViewCell {
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!

    override func awakeFromNib() {
                super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
