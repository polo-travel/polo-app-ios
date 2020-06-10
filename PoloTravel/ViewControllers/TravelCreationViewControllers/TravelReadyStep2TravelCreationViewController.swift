//
//  TravelReadyStep2ViewController.swift
//  PoloTravel
//
//  Created by SOWA KILLIAN on 10/06/2020.
//  Copyright © 2020 PoloTeam. All rights reserved.
//

import Foundation

import UIKit

class TravelReadyStep2TravelCreationViewController: UIViewController {


    var gift:Bool?
    var budget:Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }

    @IBAction func confirmButtonClicked(_ sender: Any) {
        if gift == true {
            self.performSegue(withIdentifier: "toInvitations", sender: nil)
        } else {
            self.performSegue(withIdentifier: "toEnd", sender: nil)
        }
        
    }
    

}
