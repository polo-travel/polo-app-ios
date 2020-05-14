//
//  TravelsPendingViewController.swift
//  PoloTravel
//
//  Created by SOWA KILLIAN on 12/05/2020.
//  Copyright © 2020 PoloTeam. All rights reserved.
//

import Foundation
import UIKit

class TravelsPendingViewController: UIViewController {
    @IBOutlet weak var buttonJoinTravel: BasicButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonJoinTravel.setRedButton()
    }
    
}
