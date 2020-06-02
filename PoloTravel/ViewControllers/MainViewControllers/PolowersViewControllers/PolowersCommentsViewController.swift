//
//  PolowersCommentsViewController.swift
//  PoloTravel
//
//  Created by Nael Messaoudene on 02/06/2020.
//  Copyright © 2020 PoloTeam. All rights reserved.
//

import UIKit

class PolowersCommentsViewController: UIViewController {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lbl: UILabel!
    
    var name = ""
    var imgURL = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(imgURL)
        
        lbl.text = name
//        img.image = UIImage(named: imgURL)

        // Do any additional setup after loading the view.
    }
    



}
