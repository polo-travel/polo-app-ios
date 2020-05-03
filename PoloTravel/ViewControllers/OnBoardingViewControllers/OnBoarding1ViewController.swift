//
//  Onboarding1ViewController.swift
//  PoloTravel
//
//  Created by SOWA KILLIAN on 08/04/2020.
//  Copyright © 2020 PoloTeam. All rights reserved.
//

import UIKit

class OnBoarding1ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
   
}

