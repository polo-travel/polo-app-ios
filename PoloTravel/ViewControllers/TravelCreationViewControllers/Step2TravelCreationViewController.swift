//
//  Step2TravelCreationViewController.swift
//  PoloTravel
//
//  Created by Nael Messaoudene on 02/05/2020.
//  Copyright © 2020 PoloTeam. All rights reserved.
//
import Foundation
import UIKit

class Step2TravelCreationViewController: UIViewController {

    @IBOutlet weak var nextButton: BasicButton!
    @IBOutlet weak var buttonWrapper: UIView!
    
    @IBOutlet var buttons: [UIButton]!

    let questions = ["J’adore l’adrénaline !!","Bof, mais je le fais quand même", "Jamais de la vie"]
    override func viewDidLoad() {
        super.viewDidLoad()

        customNextButton()
        getBtn()
    
    }


    func getBtn(){
        for view in buttonWrapper.subviews as [UIView] {
            if let btn = view as? BasicButton {
                btn.setWhiteButton()
                btn.setTitle(questions[btn.tag], for: .normal)
            }
        }
    }
    
    
    @IBAction func show(sender: UIButton) {

         self.buttons.forEach { (button) in
            button.backgroundColor = (button === sender) ? UIColor.MainTheme.mainDarkBlue : .white
            button.setTitleColor((button === sender) ? .white : UIColor.MainTheme.mainDarkBlue, for: .normal)
        }
        print(sender.tag)
    }
  
    func customNextButton(){
        
        nextButton.setImage(UIImage(named: "right_arrow"), for: .normal)
        nextButton.imageEdgeInsets = UIEdgeInsets(top: 0,left: 0,bottom: 0,right: 0)
        nextButton.contentMode = .center
        nextButton.imageView?.contentMode = .scaleAspectFit
        nextButton.setDarkButton()

    }

}
