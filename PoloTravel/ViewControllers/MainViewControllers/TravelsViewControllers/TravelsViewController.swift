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
    
    @IBOutlet weak var buttonLookTravel: BasicButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var nextTravelDate: UILabel!
    @IBOutlet weak var typeAventurerLabel: UILabel!
    @IBOutlet weak var buttonKnowMore: UIButton!
    var user: User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonLookTravel.setRedButton()
        activityIndicator.startAnimating()
        buttonKnowMore.isHidden = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        UserService().currentUser() { result  in
            self.user = result
            
            let formatter = DateFormatter()
            formatter.dateFormat = "dd.MM"
            
            TravelService().currentTravel() { result in
                if let currentTravel = result {
                    let startDate = formatter.string(from: currentTravel.startDate)
                    let endDate = formatter.string(from: currentTravel.endDate)
                    
                    self.activityIndicator.stopAnimating()
                    self.nextTravelDate.text = "Du \(startDate) au \(endDate)"
                    self.typeAventurerLabel.text = "Aventurier expert"
                    self.buttonKnowMore.isHidden = false
                } else {
                    self.activityIndicator.stopAnimating()
                    self.nextTravelDate.text = "Aucun voyage prévu"
                    self.typeAventurerLabel.text = ""
                }
            }
        }

        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
}

