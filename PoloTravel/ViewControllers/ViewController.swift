//
//  ViewController.swift
//  PoloTravel
//
//  Created by SOWA KILLIAN on 08/04/2020.
//  Copyright © 2020 PoloTeam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var googleButton: BasicButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        googleButton.setDarkButton()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
}

