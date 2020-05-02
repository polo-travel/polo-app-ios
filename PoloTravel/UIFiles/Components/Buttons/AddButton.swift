//
//  AddButton.swift
//  PoloTravel
//
//  Created by SOWA KILLIAN on 02/05/2020.
//  Copyright © 2020 PoloTeam. All rights reserved.
//

import UIKit

class MoreButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame : frame)
        setupButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    
    func setupButton() {
        setTitleColor(.white, for: .normal)
        backgroundColor      = UIColor.MainTheme.mainRed
        titleLabel?.font     = UIFont(name: "Gilroy-Medium", size: 50)
        layer.cornerRadius   = 25
        setShadow(shadowColor: UIColor.MainTheme.mainRed.cgColor)
        applyGradient(colors: [UIColor.MainTheme.mainRed.cgColor, UIColor.MainTheme.mainMidRed.cgColor])
    }
    
    
    private func setShadow(shadowColor: CGColor) {
        layer.shadowColor   = shadowColor
        layer.shadowOffset  = CGSize(width: 0.0, height: 0.0)
        layer.shadowRadius  = 4
        layer.shadowOpacity = 0.6
        clipsToBounds       = true
        layer.masksToBounds = false
    }
    
    private func applyGradient(colors: [CGColor]) {
        self.backgroundColor = nil
        self.layoutIfNeeded()
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = colors
        gradientLayer.startPoint = CGPoint(x: 0.2, y: 1)
        gradientLayer.endPoint = CGPoint(x: 0.8, y: 0)
        gradientLayer.frame = self.bounds
        gradientLayer.cornerRadius = self.frame.height/2
        self.layer.insertSublayer(gradientLayer, at: 0)
        self.contentVerticalAlignment = .center
    }
    

    
    
}

