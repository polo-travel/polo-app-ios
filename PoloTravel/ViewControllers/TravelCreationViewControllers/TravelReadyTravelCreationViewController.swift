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
            TravelCreationService().addTravelToCurrentUser(travelChoices: travelChoices) { success in
                DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
                    print("TRAVELCREATION: travel added")
                    self.iconReady.fadeTransition(0.4)
                    self.buttonSeeTravel.fadeTransition(0.4)
                    self.iconReady.isHidden = false
                    self.buttonSeeTravel.isHidden = false
                    self.activityIndicator.stopAnimating()
                }
            
            }
        } else {
            print("TRAVELCREATION: travel addition failed")
        }
        
    }
    
    @IBAction func buttonSeeTravelClicked(_ sender: Any) {
        self.performSegue(withIdentifier: "toPayment", sender: nil)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toPayment" {
            if let dest = segue.destination as? TravelReadyStep2TravelCreationViewController {
                dest.budget = travelChoices?.budget
                dest.gift = travelChoices?.gift
            }
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }

}
