//
//  BasicButton.swift
//  PoloTravel
//
//  Created by SOWA KILLIAN on 26/04/2020.
//  Copyright © 2020 PoloTeam. All rights reserved.
//

import UIKit

class BasicButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame : frame)
        setupButton()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }
    
    func setupButton() {
        setTitleColor(UIColor.MainTheme.mainDarkBlue, for: .normal)
        backgroundColor      = UIColor.white
        titleLabel?.font     = UIFont(name: "Gilroy-Medium", size: 16)
        layer.cornerRadius   = 25
        layer.borderWidth    = 1.0
        layer.borderColor    = UIColor.darkGray.cgColor
    }
    
    func setRedButton() {
        backgroundColor = UIColor.MainTheme.mainRed
        layer.borderWidth = 0.0
        setTitleColor(.white, for: .normal)
        setShadow(shadowColor: UIColor.MainTheme.mainRed.cgColor)
        applyGradient(colors: [UIColor.MainTheme.mainRed.cgColor, UIColor.MainTheme.mainMidRed.cgColor])
    }
    
    func setDarkButton() {
        backgroundColor = UIColor.MainTheme.mainDarkBlue
        layer.borderWidth = 0.0
        setTitleColor(.white, for: .normal)
        setShadow(shadowColor: UIColor.MainTheme.mainDarkBlue.cgColor)
        applyGradient(colors: [UIColor.MainTheme.mainDarkBlue.cgColor, UIColor.MainTheme.mainMidBlue.cgColor])
    }
    
    func setConfirmButton() {
        setDarkButton()
        layer.shadowOpacity = 0
        layer.cornerRadius   = 10
    }
    
    func setWhiteButton() {
        backgroundColor = UIColor.white
        layer.borderWidth = 0.0
        setTitleColor(.white, for: .normal)
        layer.cornerRadius = 10.0
        setTitleColor(UIColor.MainTheme.mainDarkBlue, for: .normal)
    }
    
    func setNextButton() {
        setImage(UIImage(named: "right_arrow"), for: .normal)
        imageEdgeInsets = UIEdgeInsets(top: 0,left: 0,bottom: 0,right: 0)
        contentMode = .center
        imageView?.contentMode = .scaleAspectFit
        setDarkButton()
        layer.shadowOpacity = 0
    }
    
    func setNextLittleButton() {
        setNextButton()
        setImage(UIImage(named: "little_right_arrow"), for: .normal)
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
