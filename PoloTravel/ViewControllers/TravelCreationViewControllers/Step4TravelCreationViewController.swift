//
//  Step4TravelCreationViewController.swift
//  PoloTravel
//
//  Created by Nael Messaoudene on 02/05/2020.
//  Copyright © 2020 PoloTeam. All rights reserved.
//

import UIKit

class Step4TravelCreationViewController: UIViewController {

    @IBOutlet weak var nextButton: BasicButton!
    @IBOutlet weak var buttonWrapper: UIView!
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet weak var questionLabel: UILabel!
    
    var travelChoices: TravelChoices?
    var sleepPlace: Int?

     let questions = ["L'évasion","Le retour aux sources !", "La tranquillité"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nextButton.setNextButton()
        nextButton.isEnabled = false
        getBtn()
        
        self.questionLabel.fadeTransition(0.4)
        if let gift = self.travelChoices?.gift {
            if gift == true {
                self.questionLabel.text = "Il/elle associe le mot voyage à.."
            } else {
                self.questionLabel.text = "Vous associez le mot voyage à.."
            }
        }
    }
    
    
    func getBtn(){
        for view in buttonWrapper.subviews as [UIView] {
            if let btn = view as? BasicButton {
                btn.setWhiteButton()
                btn.setTitle(questions[btn.tag], for: .normal)
               // btn.contentMode = .center
                btn.titleLabel?.textAlignment = .center
                btn.titleLabel?.font = UIFont(name: "Gilroy-Medium", size: 15)
            }
        }
    }
    
    @IBAction func show(sender: UIButton) {
         self.buttons.forEach { (button) in
            button.backgroundColor = (button === sender) ? UIColor.MainTheme.mainDarkBlue : .white
            button.setTitleColor((button === sender) ? .white : UIColor.MainTheme.mainDarkBlue, for: .normal)
        }
        sleepPlace = sender.tag
        if (nextButton.isEnabled == false) {
            nextButton.isEnabled = true
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toStep5" {
            if let dest = segue.destination as? Step5TravelCreationViewController {
                dest.travelChoices = TravelChoices(gift: travelChoices?.gift, nbPeople: travelChoices?.nbPeople, danger:travelChoices?.danger, forestLosted: travelChoices?.forestLosted, sleepPlace: sleepPlace)
            }
        }
    }
    
    @IBAction func nextButtonClicked(_ sender: Any) {
        if sleepPlace != nil {
            self.performSegue(withIdentifier: "toStep5", sender: nil)
        } else {
            print("Sélectionnez une réponse")
        }
    }
    
    @IBAction func backButtonClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

}
