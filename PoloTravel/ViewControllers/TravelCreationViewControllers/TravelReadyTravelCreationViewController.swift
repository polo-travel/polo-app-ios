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
    var travelChoices: TravelChoices?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print(travelChoices)
        buttonSeeTravel.setDarkButton()
        activityIndicator.startAnimating()
        
        if let travelChoices = travelChoices {
            print("im in travelChoices")
            TravelCreationService().addTravelToCurrentUser(travelChoices: travelChoices) { success in
                print("travel added")
            }
        } else {
            print("fail")
        }
        
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }

}
