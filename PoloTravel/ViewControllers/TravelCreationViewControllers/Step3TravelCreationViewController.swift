//
//  Step3TravelCreationViewController.swift
//  PoloTravel
//
//  Created by Nael Messaoudene on 02/05/2020.
//  Copyright © 2020 PoloTeam. All rights reserved.
//
import Foundation
import UIKit

class Step3TravelCreationViewController: UIViewController {

    @IBOutlet weak var buttonWrapper: UIView!
    @IBOutlet weak var nextButton: BasicButton!
    @IBOutlet var buttons: [UIButton]!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var poloImage: UIImageView!
    
    var travelChoices: TravelChoices?
    var r2: Int?
    
    let questions = ["Perdre ses repères","Renouer avec la nature", "S'écouter davantage"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nextButton.setNextButton()
        nextButton.isEnabled = false
        getBtn()
        
        if let prevRep = travelChoices?.q1 {
            switch prevRep {
            case 1:
                poloImage.image = UIImage(named: "R2.2.png")
            case 2:
                poloImage.image = UIImage(named: "R2.3.png")
            default:
                poloImage.image = UIImage(named: "R2.1.png")
            }
        }
        
        self.questionLabel.fadeTransition(0.4)
        if let gift = self.travelChoices?.gift {
            if gift == true {
                self.questionLabel.text = "Quel est pour lui/elle le secret pour un voyage réussi ?"
            } else {
                self.questionLabel.text = "Quel est pour vous le secret pour un voyage réussi ?"
            }
        }
    }
    
    func getBtn(){
        for view in buttonWrapper.subviews as [UIView] {
            if let btn = view as? BasicButton {
                btn.setWhiteButton()
                btn.setTitle(questions[btn.tag], for: .normal)
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
        r2 = sender.tag
        print(r2)
        
        if let prevRep = travelChoices?.q1 {
            switch prevRep {
            case 1:
                switch r2 {
                case 1:
                    poloImage.image = UIImage(named: "R2.2+R3.2.png")
                case 2:
                    poloImage.image = UIImage(named: "R2.2+R3.3.png")
                default:
                    poloImage.image = UIImage(named: "R2.2+R3.1.png")
                }
            case 2:
                switch r2 {
                case 1:
                    poloImage.image = UIImage(named: "R2.3+R3.2.png")
                case 2:
                    poloImage.image = UIImage(named: "R2.3+R3.3.png")
                default:
                    poloImage.image = UIImage(named: "R2.3+R3.1.png")
                }
            default:
                switch r2 {
                case 1:
                    poloImage.image = UIImage(named: "R2.1+R3.2.png")
                case 2:
                    poloImage.image = UIImage(named: "R2.1+R3.3.png")
                default:
                    poloImage.image = UIImage(named: "R2.1+R3.1.png")
                }
            }
        }
        
        if (nextButton.isEnabled == false) {
            nextButton.isEnabled = true
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toStep4" {
            if let dest = segue.destination as? Step4TravelCreationViewController {
                dest.travelChoices = TravelChoices(gift: travelChoices?.gift, nbPeople: travelChoices?.nbPeople, q1:travelChoices?.q1, q2: r2)
            }
        }
    }
    
    @IBAction func nextButtonClicked(_ sender: Any) {
        if r2 != nil {
            self.performSegue(withIdentifier: "toStep4", sender: nil)
        } else {
            print("Sélectionnez une réponse")
        }
        
    }
    
    
    @IBAction func backButtonClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

}
