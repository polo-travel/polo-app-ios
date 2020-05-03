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
    @IBOutlet weak var buttonCreateTravel: BasicButton!
    @IBOutlet weak var firstNameLabel: UILabel!
    var user:User?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        buttonCreateTravel.setDarkButton()
        buttonEditProfile.setRedButton()
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        UserService().currentUser() { result  in
            self.user = result
            print(result)
            self.firstNameLabel.text = "\(String(self.user?.firstName ?? "")) \(String(self.user?.lastName ?? ""))"
        }

        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }

}
