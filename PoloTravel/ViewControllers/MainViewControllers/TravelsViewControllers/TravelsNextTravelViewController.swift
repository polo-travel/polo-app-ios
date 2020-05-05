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
    @IBOutlet weak var d1DateLabel: UILabel!
    @IBOutlet weak var d2DateLabel: UILabel!
    @IBOutlet weak var h1DateLabel: UILabel!
    @IBOutlet weak var h2DateLabel: UILabel!
    @IBOutlet weak var m1DateLabel: UILabel!
    @IBOutlet weak var m2DateLabel: UILabel!
    @IBOutlet weak var mLabeltest: UILabel!
    
    
    var user: User?
    var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        timer = Timer.scheduledTimer(timeInterval: 0.30, target: self, selector: #selector(UpdateTime), userInfo: nil, repeats: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        UserService().currentUser() { result  in
            self.user = result
            
            let formatter = DateFormatter()
            formatter.dateFormat = "dd.MM"
            
            TravelService().currentTravel() { result in
                if let currentTravel = result {
                    let startDate = formatter.string(from: currentTravel.startDate)
                    let endDate = formatter.string(from: currentTravel.endDate)
                    let travelGear = currentTravel.travelGear
                    
                    self.activityIndicator.stopAnimating()
                    self.nextTravelDate.text = "Du \(startDate) au \(endDate)"
                    self.typeAventurerLabel.text = "Aventurier expert"
                    self.buttonKnowMore.isHidden = false
                } else {
                    self.activityIndicator.stopAnimating()
                    self.nextTravelDate.text = "Aucun voyage prévu"
                    self.typeAventurerLabel.text = ""
                }
            }
        }

    }
    
    @objc func UpdateTime() {
        let userCalendar = Calendar.current
        // Set Current Date
        let date = Date()
        let components = userCalendar.dateComponents([.hour, .minute, .month, .year, .day, .second], from: date)
        let currentDate = userCalendar.date(from: components)!
        
        // Set Event Date
        var eventDateComponents = DateComponents()
        eventDateComponents.year = 2020
        eventDateComponents.month = 07
        eventDateComponents.day = 20
        eventDateComponents.hour = 00
        eventDateComponents.minute = 00
        eventDateComponents.second = 00
        eventDateComponents.timeZone = TimeZone(abbreviation: "GMT")
        
        // Convert eventDateComponents to the user's calendar
        let eventDate = userCalendar.date(from: eventDateComponents)!
        
        // Change the seconds to days, hours, minutes and seconds
        let timeLeft = userCalendar.dateComponents([.day, .hour, .minute, .second], from: currentDate, to: eventDate)
        
        // Display Countdown
        mLabeltest.text = "\(timeLeft.day!) \(timeLeft.hour!) \(timeLeft.minute!)"
        
    }
    
    

    @IBAction func buttonBackClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}

