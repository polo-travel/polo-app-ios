//
//  TravelsNextTravelViewController.swift
//  PoloTravel
//
//  Created by SOWA KILLIAN on 19/04/2020.
//  Copyright © 2020 PoloTeam. All rights reserved.
//

import UIKit

class TravelsNextTravelViewController: UIViewController {
    @IBOutlet weak var buttonKnowMore: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var nextTravelDate: UILabel!
    @IBOutlet weak var typeAventurerLabel: UILabel!
    @IBOutlet weak var daysLeftLabel: UILabel!
    @IBOutlet weak var hoursLeftLabel: UILabel!
    @IBOutlet weak var minutesLeftLabel: UILabel!
    
    var user: User?
    var timer: Timer!
    
    var startDate: Date?
    var endDate: Date?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateTime()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM"
        
        if let startDate = self.startDate, let endDate = self.endDate {
            let startDate = formatter.string(from: startDate)
            let endDate = formatter.string(from: endDate)
        
            self.nextTravelDate.text = "Du \(startDate) au \(endDate)"
            self.typeAventurerLabel.text = "Aventurier expert"
        } else {
            self.nextTravelDate.text = "Aucun voyage prévu"
            self.typeAventurerLabel.text = ""
        }
    }
    
    @objc func updateTime() {
            if let startDate = self.startDate {
                let userCalendar = Calendar.current
                
                let convertedStartDate = userCalendar.dateComponents([.year, .month, .day], from: startDate)
                print("convertedStartDate", convertedStartDate)
                let components = userCalendar.dateComponents([.hour, .minute, .month, .year, .day, .second], from: Date())
                
                let currentDate = userCalendar.date(from: components)!
                let eventDate = userCalendar.date(from: convertedStartDate)!
                
                let timeLeft = userCalendar.dateComponents([.day, .hour, .minute, .second], from: currentDate, to: eventDate)
            
                self.daysLeftLabel.text = "\(timeLeft.day!)"
                self.hoursLeftLabel.text = "\(timeLeft.hour!)"
                self.minutesLeftLabel.text = "\(timeLeft.minute!)"
                
            } else {
                print("naze")
            }
    }
    
    

    @IBAction func buttonBackClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}

