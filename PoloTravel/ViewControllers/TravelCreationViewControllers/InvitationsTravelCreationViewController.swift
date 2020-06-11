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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()

        sendButton.setDarkButton()
    }
    
    @IBAction func sendButtonClicked(_ sender: Any) {
        self.performSegue(withIdentifier: "toEnd", sender: nil)
    }
    
}
