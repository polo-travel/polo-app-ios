//
//  Step5TravelCreationViewController.swift
//  PoloTravel
//
//  Created by Nael Messaoudene on 02/05/2020.
//  Copyright © 2020 PoloTeam. All rights reserved.
//

import UIKit

class Step5TravelCreationViewController: UIViewController {

    @IBOutlet weak var nextButton: BasicButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        customNextButton()
        // Do any additional setup after loading the view.
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
