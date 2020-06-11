//
//  PolowersCommentTableViewCell.swift
//  PoloTravel
//
//  Created by SOWA KILLIAN on 10/06/2020.
//  Copyright © 2020 PoloTeam. All rights reserved.
//

import UIKit

class PolowersCommentTableViewCell: UITableViewCell {

    
    @IBOutlet weak var firstnameLabel: UILabel!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var commentUserImage: UIImageView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    

}
