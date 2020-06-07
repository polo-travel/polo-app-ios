//
//  Step5TravelCreationViewController.swift
//  PoloTravel
//
//  Created by Nael Messaoudene on 02/05/2020.
//  Copyright © 2020 PoloTeam. All rights reserved.
//

import UIKit

class Step5TravelCreationViewController: UIViewController {

    @IBOutlet weak var nextButton: BasicButton!
    var travelChoices: TravelChoices?
    @IBOutlet weak var startDatePicker: UIDatePicker!
    @IBOutlet weak var endDatePicker: UIDatePicker!
    var startDate: Date?
    var endDate: Date?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nextButton.setNextButton()
        startDatePicker.minimumDate = Calendar.current.date(byAdding: .day, value: 2, to: Date())
        endDatePicker.minimumDate = Calendar.current.date(byAdding: .day, value: 3, to: Date())
        endDatePicker.maximumDate = Calendar.current.date(byAdding: .day, value: 7, to: Date())
        
        startDate = startDatePicker.date
        endDate = endDatePicker.date
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toStep6" {
            if let dest = segue.destination as? Step6TravelCreationViewController {
                dest.travelChoices = TravelChoices(gift: travelChoices?.gift, nbPeople: travelChoices?.nbPeople, danger:travelChoices?.danger, forestLosted: travelChoices?.forestLosted, sleepPlace: travelChoices?.sleepPlace, date: [startDate, endDate] as? [Date])
            }
        }
    }
    
    @IBAction func startDateChanged(_ sender: UIDatePicker) {
        startDate = sender.date
        endDatePicker.minimumDate = Calendar.current.date(byAdding: .day, value: 1, to: startDate!)
        endDatePicker.maximumDate = Calendar.current.date(byAdding: .day, value: 5, to: startDate!)
        
        print(sender.date)
    }
    
    @IBAction func endDateChanged(_ sender: UIDatePicker) {
        endDate = sender.date
        print(sender.date)
    }
    
    
    
    @IBAction func nextButtonClicked(_ sender: Any) {
        if startDate != nil && endDate != nil {
            self.performSegue(withIdentifier: "toStep6", sender: nil)
        } else {
            print("choose two dates")
        }
    }
    
    @IBAction func backButtonClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }

}
