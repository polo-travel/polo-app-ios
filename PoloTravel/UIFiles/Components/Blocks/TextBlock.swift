//
//  TextBlock.swift
//  PoloTravel
//
//  Created by Nael Messaoudene on 24/04/2020.
//  Copyright © 2020 PoloTeam. All rights reserved.
//

import Foundation
import UIKit

class MyView: UIView {
   var text:UILabel!
    override init(frame: CGRect) {
        super.init(frame : frame)
        
        setupTextBox()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupTextBox()
    }
    
    func setupTextBox() {
        //setTitleColor(Colors.mainDarkBlue, for: .normal)
        
        let title = UILabel(frame: CGRect(origin: CGPoint(x: 100, y: 50), size: CGSize.zero))
              title.text = "Hello Cédric !"
              title.textColor = UIColor.black
              title.sizeToFit()
              addSubview(title)
        
        
        let content = UILabel(frame: CGRect(origin: CGPoint(x: 0, y: 100), size: CGSize.zero))
                     content.text = "Moi c’est Polo, ton assistant de voyage, c’est moi qui vais te surprendre  ! Comme tu peux le voir je suis très peu équipé pour partir à l’aventure. Je vais donc te poser quelques questions pour savoir ce que je peux te préparer comme surprise. Cela te prendra 5 minutes !"
                     content.textColor = UIColor.black
                     content.sizeToFit()
                     addSubview(content)
       
    
        backgroundColor      = UIColor.yellow
        layer.cornerRadius   = 25
        layer.borderWidth    = 1.0
        layer.borderColor    = UIColor.darkGray.cgColor
    }
    

    
    
}
