//
//  TravelsViewController.swift
//  PoloTravel
//
//  Created by SOWA KILLIAN on 18/04/2020.
//  Copyright © 2020 PoloTeam. All rights reserved.
//

import UIKit
import FirebaseAuth

class TravelsViewController: UIViewController {
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let userManager = AuthentificationService()
        print(userManager.currentUser()?.uid ?? 0)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
}

