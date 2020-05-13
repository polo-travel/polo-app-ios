//
//  ProfileViewController.swift
//  PoloTravel
//
//  Created by SOWA KILLIAN on 18/04/2020.
//  Copyright © 2020 PoloTeam. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var buttonEditProfile: BasicButton!
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var nextTravelDate: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var typeAventurerLabel: UILabel!
    @IBOutlet weak var buttonKnowMore: UIButton!
    @IBOutlet weak var profilePhoto: RoundedImage!
    var user:User?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        buttonEditProfile.setRedButton()
        buttonEditProfile.titleLabel?.font = UIFont(name: "Gilroy-Medium", size: 14)
        self.buttonKnowMore.isHidden = true
        activityIndicator.startAnimating()
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        UserService().currentUser() { result  in
            self.user = result
            
            let formatter = DateFormatter()
            formatter.dateFormat = "dd.MM"
            
            TravelService().pastTravels() { result in
                if let pastTravels = result {
                    
                } else {
                    
                }
            }
            
            TravelService().currentTravel() { result in
                if let currentTravel = result {
                    let startDate = formatter.string(from: currentTravel.startDate)
                    let endDate = formatter.string(from: currentTravel.endDate)
            
                    if let url = self.user?.photoURL {
                        print("url", url)
                        self.profilePhoto.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: "photo.png"))
                    } else {
                        print("echecbroww")
                    }
                    
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
            
            self.firstNameLabel.text = "\(String(self.user?.firstName ?? "")) \(String(self.user?.lastName ?? ""))"
        }
        
        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    

}
