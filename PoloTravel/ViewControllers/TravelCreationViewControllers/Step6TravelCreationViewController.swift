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
    @IBOutlet weak var viewBudget: UIView!
    
    var imageView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.image = UIImage(named: "budget_bg")
        imageView.contentMode = .scaleToFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        viewBudget.insertSubview(imageView, at: 0)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: viewBudget.topAnchor),
            imageView.leadingAnchor.constraint(equalTo: viewBudget.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: viewBudget.trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: viewBudget.bottomAnchor)
        ])
        
        nextButton.setNextButton()
        nextButton.isEnabled = false
    }
    

    @IBAction func priceSlider(_ sender: UISlider) {
        let fixed = roundf(sender.value / 10.0) * 10.0;
        sender.setValue(fixed, animated: true)
        budget = Int(sender.value)
        
        let trackRect: CGRect  = slider.trackRect(forBounds: slider.bounds)
        let thumbRect: CGRect  = slider.thumbRect(forBounds: slider.bounds , trackRect: trackRect, value: slider.value)
        let x = thumbRect.origin.x + slider.frame.origin.x + 15
        let y = slider.frame.origin.y - 39
        viewBudget.center = CGPoint(x: x, y: y)

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
                dest.travelChoices = TravelChoices(gift: travelChoices?.gift, nbPeople: travelChoices?.nbPeople, danger:travelChoices?.danger, forestLosted: travelChoices?.forestLosted, sleepPlace: travelChoices?.sleepPlace, date: travelChoices?.date, budget: budget)
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
