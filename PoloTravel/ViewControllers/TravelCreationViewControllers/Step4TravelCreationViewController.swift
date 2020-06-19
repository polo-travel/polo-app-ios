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
    @IBOutlet weak var poloImage: UIImageView!
    
    var travelChoices: TravelChoices?
    var r3: Int?
    var finalPoloImage: String?

     let questions = ["A l'hôtel pour le confort","A la belle étoile", "Chez lui/elle pour être tranquille"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nextButton.setNextButton()
        nextButton.isEnabled = false
        getBtn()
        
        if let firstRep = travelChoices?.q1 {
            if let prevRep = travelChoices?.q2 {
                print(firstRep, prevRep)
                switch firstRep {
                case 1:
                    switch prevRep {
                    case 1:
                        poloImage.image = UIImage(named: "R2.2+R3.2.png")
                    case 2:
                        poloImage.image = UIImage(named: "R2.2+R3.3.png")
                    default:
                        poloImage.image = UIImage(named: "R2.2+R3.1.png")
                    }
                case 2:
                    switch prevRep {
                    case 1:
                        poloImage.image = UIImage(named: "R2.3+R3.2.png")
                    case 2:
                        poloImage.image = UIImage(named: "R2.3+R3.3.png")
                    default:
                        poloImage.image = UIImage(named: "R2.3+R3.1.png")
                    }
                default:
                    switch prevRep {
                    case 1:
                        poloImage.image = UIImage(named: "R2.1+R3.2.png")
                    case 2:
                        poloImage.image = UIImage(named: "R2.1+R3.3.png")
                    default:
                        poloImage.image = UIImage(named: "R2.1+R3.1.png")
                    }
                }
            }
        }
        
        self.questionLabel.fadeTransition(0.4)
        if let gift = self.travelChoices?.gift {
            if gift == true {
                self.questionLabel.text = "Pendant le voyage, il/elle préfèrerait passer ses nuits"
            } else {
                self.questionLabel.text = "Pendant le voyage, vous préfereriez passer vos nuits"
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
        r3 = sender.tag
        
        if let firstRep = travelChoices?.q1 {
            if let prevRep = travelChoices?.q2 {
                print(firstRep, prevRep)
                switch firstRep {
                case 1:
                    switch prevRep {
                    case 1:
                        switch r3 {
                        case 1:
                            finalPoloImage = "R2.2+R3.2+R4.2.png"
                            poloImage.image = UIImage(named: "R2.2+R3.2+R4.2.png")
                        case 2:
                            finalPoloImage = "R2.2+R3.2+R4.3.png"
                            poloImage.image = UIImage(named: "R2.2+R3.2+R4.3.png")
                        default:
                            finalPoloImage = "R2.2+R3.2+R4.1.png"
                            poloImage.image = UIImage(named: "R2.2+R3.2+R4.1.png")
                        }
                    case 2:
                        switch r3 {
                        case 1:
                            finalPoloImage = "R2.2+R3.3+R4.2.png"
                            poloImage.image = UIImage(named: "R2.2+R3.3+R4.2.png")
                        case 2:
                            finalPoloImage = "R2.2+R3.3+R4.3.png"
                            poloImage.image = UIImage(named: "R2.2+R3.3+R4.3.png")
                        default:
                            finalPoloImage = "R2.2+R3.3+R4.1.png"
                            poloImage.image = UIImage(named: "R2.2+R3.3+R4.1.png")
                        }
                    default:
                        switch r3 {
                        case 1:
                            finalPoloImage = "R2.2+R3.1+R4.2.png"
                            poloImage.image = UIImage(named: "R2.2+R3.1+R4.2.png")
                        case 2:
                            finalPoloImage = "R2.2+R3.1+R4.3.png"
                            poloImage.image = UIImage(named: "R2.2+R3.1+R4.3.png")
                        default:
                            finalPoloImage = "R2.2+R3.1+R4.1.png"
                            poloImage.image = UIImage(named: "R2.2+R3.1+R4.1.png")
                        }
                    }
                case 2:
                    switch prevRep {
                    case 1:
                        switch r3 {
                        case 1:
                            finalPoloImage = "R2.3+R3.2+R4.2.png"
                            poloImage.image = UIImage(named: "R2.3+R3.2+R4.2.png")
                        case 2:
                            finalPoloImage = "R2.3+R3.2+R4.3.png"
                            poloImage.image = UIImage(named: "R2.3+R3.2+R4.3.png")
                        default:
                            finalPoloImage = "R2.3+R3.2+R4.1.png"
                            poloImage.image = UIImage(named: "R2.3+R3.2+R4.1.png")
                        }
                    case 2:
                        switch r3 {
                        case 1:
                            finalPoloImage = "R2.3+R3.3+R4.2.png"
                            poloImage.image = UIImage(named: "R2.3+R3.3+R4.2.png")
                        case 2:
                            finalPoloImage = "R2.3+R3.3+R4.3.png"
                            poloImage.image = UIImage(named: "R2.3+R3.3+R4.3.png")
                        default:
                            finalPoloImage = "R2.3+R3.3+R4.1.png"
                            poloImage.image = UIImage(named: "R2.3+R3.3+R4.1.png")
                        }
                    default:
                        switch r3 {
                        case 1:
                            finalPoloImage = "R2.3+R3.1+R4.2.png"
                            poloImage.image = UIImage(named: "R2.3+R3.1+R4.2.png")
                        case 2:
                            finalPoloImage = "R2.3+R3.1+R4.3.png"
                            poloImage.image = UIImage(named: "R2.3+R3.1+R4.3.png")
                        default:
                            finalPoloImage = "R2.3+R3.1+R4.1.png"
                            poloImage.image = UIImage(named: "R2.3+R3.1+R4.1.png")
                        }
                    }
                default:
                    switch prevRep {
                    case 1:
                        switch r3 {
                        case 1:
                            finalPoloImage = "R2.1+R3.2+R4.2.png"
                            poloImage.image = UIImage(named: "R2.1+R3.2+R4.2.png")
                        case 2:
                            finalPoloImage = "R2.1+R3.2+R4.3.png"
                            poloImage.image = UIImage(named: "R2.1+R3.2+R4.3.png")
                        default:
                            finalPoloImage = "R2.1+R3.2+R4.1.png"
                            poloImage.image = UIImage(named: "R2.1+R3.2+R4.1.png")
                        }
                    case 2:
                        switch r3 {
                        case 1:
                            finalPoloImage = "R2.1+R3.3+R4.2.png"
                            poloImage.image = UIImage(named: "R2.1+R3.3+R4.2.png")
                        case 2:
                            finalPoloImage = "R2.1+R3.3+R4.3.png"
                            poloImage.image = UIImage(named: "R2.1+R3.3+R4.3.png")
                        default:
                            finalPoloImage = "R2.1+R3.3+R4.1.png"
                            poloImage.image = UIImage(named: "R2.1+R3.3+R4.1.png")
                        }
                    default:
                        switch r3 {
                        case 1:
                            finalPoloImage = "R2.1+R3.1+R4.2.png"
                            poloImage.image = UIImage(named: "R2.1+R3.1+R4.2.png")
                        case 2:
                            finalPoloImage = "R2.1+R3.1+R4.3.png"
                            poloImage.image = UIImage(named: "R2.1+R3.1+R4.3.png")
                        default:
                            finalPoloImage = "R2.1+R3.1+R4.1.png"
                            poloImage.image = UIImage(named: "R2.1+R3.1+R4.1.png")
                        }
                    }
                }
            }
        }
        if (nextButton.isEnabled == false) {
            nextButton.isEnabled = true
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toStep5" {
            if let dest = segue.destination as? Step5TravelCreationViewController {
                dest.travelChoices = TravelChoices(gift: travelChoices?.gift, nbPeople: travelChoices?.nbPeople, q1:travelChoices?.q1, q2: travelChoices?.q2, q3: r3, finalPoloImage: finalPoloImage)
            }
        }
    }
    
    @IBAction func nextButtonClicked(_ sender: Any) {
        if r3 != nil {
            self.performSegue(withIdentifier: "toStep5", sender: nil)
        } else {
            print("Sélectionnez une réponse")
        }
    }
    
    @IBAction func backButtonClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

}
