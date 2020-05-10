//
//  RoundedImage.swift
//  PoloTravel
//
//  Created by SOWA KILLIAN on 10/05/2020.
//  Copyright © 2020 PoloTeam. All rights reserved.
//

import Foundation
import UIKit

class RoundedImage: UIImageView {
    override init(frame: CGRect) {
        super.init(frame : frame)
        setupImage()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupImage()
    }
    
    func setupImage() {
        layer.masksToBounds = false
        layer.cornerRadius = frame.height/2
        clipsToBounds = true
    }
}
