//
//  ProfileTravelHistoryViewController.swift
//  PoloTravel
//
//  Created by SOWA KILLIAN on 19/04/2020.
//  Copyright © 2020 PoloTeam. All rights reserved.
//

import UIKit

class ProfileTravelHistoryViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.navigationController?.setNavigationBarHidden(false, animated: animated)
    }


}
