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
    override func viewDidLoad() {
        super.viewDidLoad()

        confirmButton.setDarkButton()
        getBtn()
        // Do any additional setup after loading the view.
    }
    
    func getBtn(){
        for view in recapWrapper.subviews as [UIView] {
            if let btn = view as? BasicButton {
                btn.setWhiteButton()
                //btn.backgroundColor = UIColor.MainTheme.mainDarkBlue
                
                btn.setTitle(questions[btn.tag], for: .normal)
               // btn.contentMode = .center
                btn.titleLabel?.textAlignment = .center
                btn.titleLabel?.font = UIFont(name: "Gilroy-Medium", size: 15)
                //btn.titleLabel?.textColor = .white
            }
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
