//
//  ProfileMenuTableViewCell.swift
//  PoloTravel
//
//  Created by SOWA KILLIAN on 13/05/2020.
//  Copyright © 2020 PoloTeam. All rights reserved.
//

import Foundation

import UIKit

class ProfileMenuTableViewCell: UITableViewCell {
    
    lazy var backView: UIView = {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 414, height: 50))
        print("frame", self.frame)
        view.backgroundColor = UIColor.MainTheme.mainDarkBlue
        return view
    }()
    
    lazy var settingImage: UIImageView = {
       let imageView = UIImageView(frame: CGRect(x: 15, y: 10, width: 30, height: 30))
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    lazy var lbl: UILabel = {
       let lbl = UILabel(frame: CGRect(x: 60, y: 10, width: self.frame.width, height: 30))
        lbl.font = UIFont(name: "Gilroy-Medium", size: 20)
        lbl.textColor = UIColor.white
        return lbl
    }()

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        addSubview(backView)
        backView.addSubview(settingImage)
        backView.addSubview(lbl)
        // Configure the view for the selected state
    }

}
