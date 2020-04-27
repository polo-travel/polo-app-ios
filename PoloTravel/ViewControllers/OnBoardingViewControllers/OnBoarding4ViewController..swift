//
//  Onboarding4ViewController..swift
//  PoloTravel
//
//  Created by SOWA KILLIAN on 17/04/2020.
//  Copyright © 2020 PoloTeam. All rights reserved.
//

import UIKit

class OnBoarding4ViewController: UIViewController {
 
    @IBOutlet weak var nextViewButton: BasicButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        nextViewButton.setRedButton()
 
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
}

