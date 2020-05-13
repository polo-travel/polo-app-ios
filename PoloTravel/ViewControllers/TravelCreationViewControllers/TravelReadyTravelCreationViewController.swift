//
//  TravelReadyTravelCreationViewController.swift
//  PoloTravel
//
//  Created by SOWA KILLIAN on 05/05/2020.
//  Copyright © 2020 PoloTeam. All rights reserved.
//

import Foundation
import UIKit

class TravelReadyTravelCreationViewController: UIViewController {

    @IBOutlet weak var buttonSeeTravel: BasicButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var labelReady: UILabel!
    var travelChoices: TravelChoices?
    @IBOutlet weak var iconReady: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        buttonSeeTravel.isHidden = true
        iconReady.isHidden = true
        buttonSeeTravel.setRedButton()
        activityIndicator.startAnimating()
        
        if let travelChoices = travelChoices {
            print("im in travelChoices")
            TravelCreationService().addTravelToCurrentUser(travelChoices: travelChoices) { success in
                print("TRAVELCREATION: travel added")
                self.buttonSeeTravel.isHidden = false
                self.iconReady.isHidden = false
            }
        } else {
            print("TRAVELCREATION: travel addition failed")
        }
        
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }

}
