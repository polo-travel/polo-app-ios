//
//  TravelCreation1ViewController.swift
//  PoloTravel
//
//  Created by SOWA KILLIAN on 18/04/2020.
//  Copyright © 2020 PoloTeam. All rights reserved.
//

import UIKit

class TravelCreation1ViewController: UIViewController {
    
    @IBOutlet weak var Textblock: TextBlockView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var textlabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
//
  
//        titleLabel.sizeToFit()
//        textlabel.sizeToFit()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    @IBAction func createTravel(_ sender: UIButton) {
        
    }
}


