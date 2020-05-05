//
//  Step2TravelCreationViewController.swift
//  PoloTravel
//
//  Created by Nael Messaoudene on 02/05/2020.
//  Copyright © 2020 PoloTeam. All rights reserved.
//
import Foundation
import UIKit

class Step2TravelCreationViewController: UIViewController {

    @IBOutlet weak var nextButton: BasicButton!
    @IBOutlet weak var buttonWrapper: UIView!
    @IBOutlet var buttons: [UIButton]!
    
    var travelChoices: TravelChoices?
    var selectedDanger: Int?

    let questions = ["J’adore l’adrénaline !!","Bof, mais je le fais quand même", "Jamais de la vie"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nextButton.setNextButton()
        getBtn()
    
    }

    func getBtn(){
        for view in buttonWrapper.subviews as [UIView] {
            if let btn = view as? BasicButton {
                btn.setWhiteButton()
                btn.setTitle(questions[btn.tag], for: .normal)
            }
        }
    }
    
    
    @IBAction func show(sender: UIButton) {
         self.buttons.forEach { (button) in
            button.backgroundColor = (button === sender) ? UIColor.MainTheme.mainDarkBlue : .white
            button.setTitleColor((button === sender) ? .white : UIColor.MainTheme.mainDarkBlue, for: .normal)
        }
        print(sender.tag)
        selectedDanger = sender.tag
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toStep3" {
            if let dest = segue.destination as? Step3TravelCreationViewController {
                dest.travelChoices = TravelChoices(nbPeople: travelChoices?.nbPeople, danger: selectedDanger)
            }
        }
    }
    
    @IBAction func nextButtonClicked(_ sender: Any) {
        if selectedDanger != nil {
            self.performSegue(withIdentifier: "toStep3", sender: nil)
        } else {
            print("Sélectionnez une réponse")
        }
    }
    
    @IBAction func backButtonClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    

}
