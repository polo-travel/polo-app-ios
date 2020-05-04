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
    @IBOutlet weak var poloCharacter: UIImageView!
    @IBOutlet weak var button: BasicButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupLayout()
        button.setRedButton()
    }
    

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    func setupLayout(){
        Textblock.translatesAutoresizingMaskIntoConstraints = false
        poloCharacter.layer.zPosition = 9
    }

}


