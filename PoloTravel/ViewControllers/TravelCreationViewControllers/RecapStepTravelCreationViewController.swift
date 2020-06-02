//
//  RecapStepTravelCreationViewController.swift
//  PoloTravel
//
//  Created by Nael Messaoudene on 02/05/2020.
//  Copyright © 2020 PoloTeam. All rights reserved.
//

import UIKit

class RecapStepTravelCreationViewController: UIViewController {

    @IBOutlet weak var confirmButton: BasicButton!
    @IBOutlet weak var recapWrapper: UIView!
    var recap: [String]? = ["", "", ""]
    
    var travelChoices: TravelChoices?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        recap?[1] = "Du 7 au 14 juin 2929"
        if let budget = travelChoices?.budget, let nbPeople = travelChoices?.nbPeople, let date = travelChoices?.date {
            
            let startDate = date[0].getFormattedDate(format: "d MMMM yyyy")
            let endDate = date[1].getFormattedDate(format: "d MMMM yyyy")
            
            var personnes:String?
            if nbPeople != "1" {
                personnes = "personnes"
            } else {
                personnes = "personne"
            }
            
            recap?[1] = "Du \(String(startDate)) au \(String(endDate))"
            recap?[0] = "\(String(nbPeople)) \(personnes ??  "")"
            recap?[2] = "Budget : \(String(budget))€"
        }
        
        
        confirmButton.setDarkButton()
        getBtn()
        print(travelChoices)
    }
    
    func getBtn(){
        for view in recapWrapper.subviews as [UIView] {
            if let btn = view as? BasicButton {
                btn.setDarkButton()
                
                btn.setTitle(recap?[btn.tag], for: .normal)
                btn.titleLabel?.textAlignment = .center
                btn.titleLabel?.font = UIFont(name: "Gilroy-Medium", size: 15)
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toStepReady" {
            if let dest = segue.destination as? TravelReadyTravelCreationViewController {
                dest.travelChoices = TravelChoices(nbPeople: travelChoices?.nbPeople, danger:travelChoices?.danger, forestLosted: travelChoices?.forestLosted, sleepPlace: travelChoices?.sleepPlace, date: travelChoices?.date, budget: travelChoices?.budget, adventurerLevel: 2)
            }
        }
    }

    @IBAction func confirmButtonClicked(_ sender: Any) {
        self.performSegue(withIdentifier: "toStepReady", sender: nil)
    }
    
    @IBAction func backButtonClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    

}
