//
//  InvitationViewController.swift
//  PoloTravel
//
//  Created by SOWA KILLIAN on 20/06/2020.
//  Copyright © 2020 PoloTeam. All rights reserved.
//

import Foundation
import UIKit
import Firebase
import FirebaseAuth
import FirebaseFirestore
import AppCenterAnalytics

class InvitationViewController: UIViewController, UITextFieldDelegate {
    let loginManager = AuthentificationService()
    @IBOutlet weak var numberInput1: UITextField!
    @IBOutlet weak var numberInput2: UITextField!
    @IBOutlet weak var numberInput3: UITextField!
    @IBOutlet weak var numberInput4: UITextField!
    @IBOutlet weak var numberInput5: UITextField!
    @IBOutlet weak var numberInput6: UITextField!
    @IBOutlet weak var clearButton: BasicButton!
    @IBOutlet weak var confirmButton: BasicButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let numbersInputs = [numberInput1, numberInput2, numberInput3, numberInput4, numberInput5, numberInput6]
        
        clearButton.setRedButton()
        confirmButton.setDarkButton()
        numberInput2.tag = 1
        numberInput3.tag = 2
        numberInput4.tag = 3
        numberInput5.tag = 4
        numberInput6.tag = 5
        
        for numberInput in numbersInputs {
            numberInput?.addTarget(self, action: #selector(textChanged), for: .editingChanged)
        }
        
        self.hideKeyboardWhenTappedAround()
    }

    @objc func textChanged(sender: UITextField) {
        print("testchanged")
        if (sender.text?.count)! > 0 {
            print("textcounteleve")
            let nextField = self.view.viewWithTag(sender.tag + 1) as? UITextField
            print(numberInput3.tag)
            nextField?.becomeFirstResponder()
        }
    }
    
    @IBAction func buttonConnectClicked(_ sender: Any) {
        confirmButton.setTitle("", for: .normal)
        self.activityIndicator.startAnimating()
        let email = "remigaudard@sfr.fr"
        let password = "kiki220999"
        
        loginManager.signIn(email: email, pass: password) { error in
            if error != nil {
            } else {
                MSAnalytics.trackEvent("User connection")
                self.activityIndicator.stopAnimating()
                self.switchStoryboard()
            }
        }
    }
    private func switchStoryboard() {
        let mainView: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let mainVC = mainView.instantiateViewController(identifier: "MainTabBarController")
        self.show(mainVC, sender: nil)
    }
    
    @IBAction func buttonClearClicked(_ sender: Any) {
        let numbersInputs = [numberInput1, numberInput2, numberInput3, numberInput4, numberInput5, numberInput6]
        for numberInput in numbersInputs {
            numberInput?.text = ""
        }
    }
    @IBAction func buttonBackClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
