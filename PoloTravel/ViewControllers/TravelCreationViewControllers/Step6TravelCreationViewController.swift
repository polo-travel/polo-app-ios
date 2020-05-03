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
    override func viewDidLoad() {
        super.viewDidLoad()

        nextButton.setNextButton()
    }
    

    @IBAction func priceSlider(_ sender: UISlider) {
        print(sender.value)
    }
    
    @IBAction func backButtonClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
