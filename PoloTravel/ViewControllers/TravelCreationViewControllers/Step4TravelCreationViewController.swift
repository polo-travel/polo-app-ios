//
//  Step4TravelCreationViewController.swift
//  PoloTravel
//
//  Created by Nael Messaoudene on 02/05/2020.
//  Copyright © 2020 PoloTeam. All rights reserved.
//

import UIKit

class Step4TravelCreationViewController: UIViewController {

    @IBOutlet weak var nextButton: BasicButton!
    @IBOutlet weak var buttonWrapper: UIView!
    @IBOutlet var buttons: [UIButton]!

     let questions = [" A l’hôtel, pour un max de confort","A la belle étoile, je suis chaud  !", "Chez moi, pour être tranquille"]
    override func viewDidLoad() {
        super.viewDidLoad()

        getBtn()
        customNextButton()
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
