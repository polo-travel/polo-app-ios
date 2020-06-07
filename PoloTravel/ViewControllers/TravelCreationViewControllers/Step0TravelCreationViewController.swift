//
//  Step0TravelCreationViewController.swift
//  PoloTravel
//
//  Created by SOWA KILLIAN on 05/06/2020.
//  Copyright © 2020 PoloTeam. All rights reserved.
//

import Foundation
import UIKit

class Step0TravelCreationViewController: UIViewController {

    @IBOutlet weak var buttonOffer: BasicButton!
    @IBOutlet weak var buttonPerso: BasicButton!
    var gift: Bool = true
    

    override func viewDidLoad() {
        super.viewDidLoad()

        buttonOffer.setNextLittleButton()
        buttonPerso.setNextLittleButton()
    }
    
    @IBAction func backButtonClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func offerButtonClicked(_ sender: Any) {
        self.performSegue(withIdentifier: "toStep1", sender: nil)
    }
    
    @IBAction func persoButtonClicked(_ sender: Any) {
        self.gift = false
        self.performSegue(withIdentifier: "toStep1", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toStep1" {
            if let dest = segue.destination as? Step1TravelCreationViewController {
                if self.gift == true {
                    dest.travelChoices = TravelChoices(gift: true)
                } else {
                    dest.travelChoices = TravelChoices(gift: false)
                }
                
            }
        }
    }
    
}

