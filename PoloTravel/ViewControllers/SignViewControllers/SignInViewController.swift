//
//  SignInViewController.swift
//  PoloTravel
//
//  Created by SOWA KILLIAN on 18/04/2020.
//  Copyright © 2020 PoloTeam. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseFirestore

class SignInViewController: UIViewController {
    let loginManager = AuthentificationService()
    
    @IBOutlet weak var inputEmail: UITextField!
    @IBOutlet weak var inputPassword: UITextField!
    @IBOutlet weak var buttonConnect: BasicButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var buttonCancel: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()
        buttonConnect.setDarkButton()
    }

    @IBAction func buttonConnectClicked(_ sender: Any) {
        activityIndicator.startAnimating()
        self.errorLabel.text = ""
        
        guard let email = inputEmail.text, let password = inputPassword.text else { return }
        loginManager.signIn(email: email, pass: password) {[weak self] (success) in
            guard let `self` = self else { return }
            if (success) {
                self.activityIndicator.stopAnimating()
    
                self.switchStoryboard()
            } else {
                self.errorLabel.text = "Tu as fait une erreur ! Vérifie les infos"
                self.activityIndicator.stopAnimating()
            }
        }
    }
    
    private func switchStoryboard() {
        let mainView: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let mainVC = mainView.instantiateViewController(identifier: "MainTabBarController")
        self.show(mainVC, sender: nil)
    }
    
    @IBAction func buttonCancelClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func buttonBackClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}


