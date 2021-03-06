//
//  TravelsViewController.swift
//  PoloTravel
//
//  Created by SOWA KILLIAN on 18/04/2020.
//  Copyright © 2020 PoloTeam. All rights reserved.
//

import UIKit
import FirebaseAuth

class TravelsViewController: UIViewController {
    
    @IBOutlet weak var buttonLookTravel: BasicButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var nextTravelDate: UILabel!
    @IBOutlet weak var typeAventurerLabel: UILabel!
    @IBOutlet weak var buttonKnowMore: UIButton!
    @IBOutlet weak var daysLeftLabel: UILabel!
    @IBOutlet weak var hoursLeftLabel: UILabel!
    @IBOutlet weak var minutesLeftLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    
    var user: User?
       var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonLookTravel.setRedButton()
        activityIndicator.startAnimating()
        buttonKnowMore.isHidden = true
        
        updateTime()
        timer = Timer.scheduledTimer(timeInterval: 30, target: self, selector: #selector(updateTime), userInfo: nil, repeats: true)
        
        TravelService().currentTravel() { travel in
            if travel != nil {
                self.performSegue(withIdentifier: "toCurrentTravel", sender: self)
                print("TRAVELS: A travel is pending")
            }
        }
        
        UserService().currentUser() { result  in
            self.user = result
            
            let formatter = DateFormatter()
            formatter.dateFormat = "dd.MM"
            
            TravelService().nextTravel() { result in
                if let nextTravel = result {
                    let startDate = formatter.string(from: nextTravel.startDate)
                    let endDate = formatter.string(from: nextTravel.endDate)
                    
                    self.activityIndicator.stopAnimating()
                    
                    self.titleLabel.fadeTransition(0.4)
                    
                    if nextTravel.gift == true {
                        self.titleLabel.text = "Voyage offert"
                        self.buttonLookTravel.setTitle("Voir le voyage", for: .normal)
                    } else {
                        self.titleLabel.text = "Ton prochain voyage"
                        self.buttonLookTravel.setTitle("Voir mon voyage", for: .normal)
                    }
                    
                    self.nextTravelDate.text = "Du \(startDate) au \(endDate)"
                    self.typeAventurerLabel.text = "Aventurier expert"
                    self.buttonKnowMore.isHidden = false
                } else {
                    self.buttonLookTravel.isHidden = true
                    self.activityIndicator.stopAnimating()
                    self.nextTravelDate.text = "Aucun voyage prévu"
                    self.typeAventurerLabel.text = ""
                }
            }
        }
        
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    @objc func updateTime() {
        TravelService().nextTravel() { result in
            if let nextTravel = result {
                let userCalendar = Calendar.current
                
                let startDate = nextTravel.startDate
    
                let convertedStartDate = userCalendar.dateComponents([.year, .month, .day], from: startDate)
                print("convertedStartDate", convertedStartDate)
                let components = userCalendar.dateComponents([.hour, .minute, .month, .year, .day, .second], from: Date())
                
                let currentDate = userCalendar.date(from: components)!
                let eventDate = userCalendar.date(from: convertedStartDate)!
                
                let timeLeft = userCalendar.dateComponents([.day, .hour, .minute, .second], from: currentDate, to: eventDate)
            
                self.daysLeftLabel.fadeTransition(0.4)
                self.hoursLeftLabel.fadeTransition(0.4)
                self.minutesLeftLabel.fadeTransition(0.4)
                self.daysLeftLabel.text = "\(timeLeft.day!)"
                self.hoursLeftLabel.text = "\(timeLeft.hour!)"
                self.minutesLeftLabel.text = "\(timeLeft.minute!)"
                
            } else {
                print("naze")
            }
        }
    }
  
}

