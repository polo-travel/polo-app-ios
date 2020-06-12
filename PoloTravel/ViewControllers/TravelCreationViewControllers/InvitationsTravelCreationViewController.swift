//
//  InvitationsTravelCreationViewController.swift
//  PoloTravel
//
//  Created by SOWA KILLIAN on 10/06/2020.
//  Copyright © 2020 PoloTeam. All rights reserved.
//

import Foundation

import UIKit

class InvitationsTravelCreationViewController: UIViewController {

    @IBOutlet weak var sendButton: BasicButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()

        sendButton.setDarkButton()
    }
    
    @IBAction func sendButtonClicked(_ sender: Any) {
        self.activityIndicator.startAnimating()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.performSegue(withIdentifier: "toEnd", sender: nil)
            self.activityIndicator.stopAnimating()
        }
        
    }
    
}
