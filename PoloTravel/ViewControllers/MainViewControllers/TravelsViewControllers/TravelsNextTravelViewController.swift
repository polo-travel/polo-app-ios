//
//  TravelsNextTravelViewController.swift
//  PoloTravel
//
//  Created by SOWA KILLIAN on 19/04/2020.
//  Copyright © 2020 PoloTeam. All rights reserved.
//

import UIKit

class TravelsNextTravelViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    @IBAction func buttonBackClicked(_ sender: Any) {
    }
    
}
