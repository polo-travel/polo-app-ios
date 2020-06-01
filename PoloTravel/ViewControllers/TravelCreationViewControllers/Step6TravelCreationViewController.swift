//
//  Step6TravelCreationViewController.swift
//  PoloTravel
//
//  Created by Nael Messaoudene on 02/05/2020.
//  Copyright © 2020 PoloTeam. All rights reserved.
//

import UIKit

class Step6TravelCreationViewController: UIViewController {

    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var nextButton: BasicButton!
    var travelChoices: TravelChoices?
    var budget: Int?
    @IBOutlet weak var labelBudget: UILabel!
    @IBOutlet weak var budgetView: UIImageView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nextButton.setNextButton()
        nextButton.isEnabled = false
    }
    

    @IBAction func priceSlider(_ sender: UISlider) {
        let fixed = roundf(sender.value / 10.0) * 10.0;
        sender.setValue(fixed, animated: true)
        budget = Int(sender.value)
        print(budget)
        budgetView.frame.origin.x = CGFloat(sender.value)
        if let budgetChoice = budget {
            labelBudget.text = "\(budgetChoice)€"
        }
        
        if (nextButton.isEnabled == false) {
            nextButton.isEnabled = true
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toStepRecap" {
            if let dest = segue.destination as? RecapStepTravelCreationViewController {
                dest.travelChoices = TravelChoices(nbPeople: travelChoices?.nbPeople, danger:travelChoices?.danger, forestLosted: travelChoices?.forestLosted, sleepPlace: travelChoices?.sleepPlace, date: travelChoices?.date, budget: budget)
            }
        }
    }
    
    @IBAction func nextButtonClicked(_ sender: Any) {
        if budget != nil {
            self.performSegue(withIdentifier: "toStepRecap", sender: nil)
        } else {
            print("Sélectionnez un budget")
        }
    }
    
    @IBAction func backButtonClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
