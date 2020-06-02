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
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lbl.text = name

        // Do any additional setup after loading the view.
    }
    



}
