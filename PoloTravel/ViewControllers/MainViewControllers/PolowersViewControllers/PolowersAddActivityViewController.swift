//
//  PolowersAddActivity.swift
//  PoloTravel
//
//  Created by SOWA KILLIAN on 19/04/2020.
//  Copyright © 2020 PoloTeam. All rights reserved.
//

import Foundation
import UIKit

class PolowersAddActivityViewController:UIViewController {
    @IBOutlet weak var buttonSend: BasicButton!
    @IBOutlet weak var pickerView: UIPickerView!
    let activitiesType: [String] = ["Gastronomique", "Sportive", "Culturelle"]
    override func viewDidLoad() {
         super.viewDidLoad()
        
        pickerView.delegate = self
        pickerView.dataSource = self
        
        buttonSend.setRedButton()

     }
    @IBAction func buttonBackClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}

extension PolowersAddActivityViewController:UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
      
       return 1
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return activitiesType.count
    }
}

extension PolowersAddActivityViewController:UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return activitiesType[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let label = UILabel()
        label.font = UIFont(name: "Gilroy-Medium", size: 12)
        label.textColor = UIColor.MainTheme.mainDarkBlue
        label.minimumScaleFactor = 0.5
        label.textAlignment = .left

        label.text = activitiesType[row]

        return label
    }

    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        20
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {

        
    }
    
}
