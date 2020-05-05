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
    let questions = ["3 personnes","Du 8 au 14 juin 2020 ", "Budget : 300€"]
    var travelChoices: TravelChoices?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        confirmButton.setDarkButton()
        getBtn()
        print(travelChoices)
    }
    
    func getBtn(){
        for view in recapWrapper.subviews as [UIView] {
            if let btn = view as? BasicButton {
                btn.setWhiteButton()
                
                btn.setTitle(questions[btn.tag], for: .normal)
                btn.titleLabel?.textAlignment = .center
                btn.titleLabel?.font = UIFont(name: "Gilroy-Medium", size: 15)
            }
        }
    }

    @IBAction func backButtonClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    

}
