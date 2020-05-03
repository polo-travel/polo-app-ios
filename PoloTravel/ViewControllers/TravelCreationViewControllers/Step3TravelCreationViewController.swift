//
//  Step3TravelCreationViewController.swift
//  PoloTravel
//
//  Created by Nael Messaoudene on 02/05/2020.
//  Copyright © 2020 PoloTeam. All rights reserved.
//
import Foundation
import UIKit

class Step3TravelCreationViewController: UIViewController {

    @IBOutlet weak var buttonWrapper: UIView!
    @IBOutlet weak var nextButton: BasicButton!
    @IBOutlet var buttons: [UIButton]!

    let questions = ["Je me construis un abri \net je mange des sauterelles","Je crie « Au secours! »\n en courant dans tous les sens", "Je sors ma boussole et retrouve\n rapidement mon chemin"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        customNextButton()
        getBtn()
        // Do any additional setup after loading the view.
    }
    
    
    func getBtn(){
        for view in buttonWrapper.subviews as [UIView] {
            if let btn = view as? BasicButton {
                btn.setWhiteButton()
                btn.setTitle(questions[btn.tag], for: .normal)
               // btn.contentMode = .center
                btn.titleLabel?.textAlignment = .center
                btn.titleLabel?.font = UIFont(name: "Gilroy-Medium", size: 15)
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
