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

class SignUpViewController: UIViewController {
    
    @IBOutlet weak var inputFirstName: UITextField!
    @IBOutlet weak var inputEmail: UITextField!
    @IBOutlet weak var inputPassword: UITextField!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    @IBOutlet weak var buttonNext: DarkBasicButton!
    @IBOutlet weak var buttonCancel: UIButton!
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    let db = Firestore.firestore()
    let onboardingController = OnBoarding1ViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonNextClicked(_ sender: Any) {
        activityIndicator.startAnimating()
        self.errorLabel.text = ""
        
        let email = inputEmail.text!
        let password = inputPassword.text!
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if(error != nil) {
                self.errorLabel.text = "Tu as fait une erreur ! Vérifie les infos"
                print(error!)
                self.activityIndicator.stopAnimating()
                return
            }
            self.db.collection("users").document(authResult!.user.uid).setData([
                "firstname": self.inputFirstName.text!,
            ])
            self.errorLabel.text = "User created!"
            self.activityIndicator.stopAnimating()
            
            let onBoardingView: UIStoryboard = UIStoryboard(name: "OnBoarding", bundle: nil)
            let onBoarding1VC = onBoardingView.instantiateViewController(identifier: "OnBoarding1ViewController")
            self.show(onBoarding1VC, sender: nil)
        }
    }
    
    @IBAction func buttonCancelClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}


