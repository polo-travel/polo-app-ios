//
//  RegistrationViewController.swift
//  PoloTravel
//
//  Created by SOWA KILLIAN on 17/04/2020.
//  Copyright © 2020 PoloTeam. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseFirestore
import AppCenterAnalytics

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var inputFirstName: UITextField!
    @IBOutlet weak var inputLastName: UITextField!
    @IBOutlet weak var inputEmail: UITextField!
    @IBOutlet weak var inputPassword: UITextField!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var buttonNext: BasicButton!
    @IBOutlet weak var buttonCancel: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    let signUpManager = AuthentificationService()
    let db = Firestore.firestore()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()

        buttonNext.setDarkButton()
    }
    
    @IBAction func buttonNextClicked(_ sender: Any) {
        activityIndicator.startAnimating()
        self.errorLabel.text = ""
        
        if let email = inputEmail.text, let password = inputPassword.text, let firstname = inputFirstName.text, let lastname = inputLastName.text {
            signUpManager.createUser(email: email, password: password, firstname: firstname, lastname: lastname) { error in
                if error != nil {
                    self.errorLabel.text = error?.errorMessage
                    self.activityIndicator.stopAnimating()
                } else {
                    self.activityIndicator.stopAnimating()
                    MSAnalytics.trackEvent("Account created")
                    self.switchStoryboard()
                }
            }
        }
            
    }
    
    private func switchStoryboard() {
        let onBoardingView: UIStoryboard = UIStoryboard(name: "OnBoarding", bundle: nil)
        let onBoarding1VC = onBoardingView.instantiateViewController(identifier: "OnBoardingMainViewController")
        self.show(onBoarding1VC, sender: nil)
    }
    
    @IBAction func buttonCancelClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func buttonBackClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}


