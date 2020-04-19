//
//  DarkBasicButton.swift
//  PoloTravel
//
//  Created by SOWA KILLIAN on 17/04/2020.
//  Copyright © 2020 PoloTeam. All rights reserved.
//

import UIKit

class DarkBasicButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame : frame)
        setupButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    
        func setupButton() {
        setShadow()
        setTitleColor(.white, for: .normal)
    
        backgroundColor      = Colors.mainDarkBlue
        titleLabel?.font     = UIFont(name: "Gilroy-Medium", size: 16)
        layer.cornerRadius   = 25
    }
    
    
    private func setShadow() {
        layer.shadowColor   = UIColor.black.cgColor
        layer.shadowOffset  = CGSize(width: 0.0, height: 6.0)
        layer.shadowRadius  = 8
        layer.shadowOpacity = 0.5
        clipsToBounds       = true
        layer.masksToBounds = false
    }

    
    
}
