//
//  RadiusBlock.swift
//  PoloTravel
//
//  Created by SOWA KILLIAN on 04/05/2020.
//  Copyright © 2020 PoloTeam. All rights reserved.
//

import UIKit

class RadiusBlock: UIView {
    
    override init(frame: CGRect) {
        super.init(frame : frame)
        setupBlock()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupBlock()
    }
    
    func setupBlock() {
        backgroundColor      = UIColor.white
        layer.cornerRadius   = 30
    }
    
    private func setShadow(shadowColor: CGColor) {
        layer.shadowColor   = shadowColor
        layer.shadowOffset  = CGSize(width: 0.0, height: 0.0)
        layer.shadowRadius  = 4
        layer.shadowOpacity = 0.06
        clipsToBounds       = true
        layer.masksToBounds = false
    }
    
}

