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
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
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
    
    @IBAction func buttonSendClicked(_ sender: Any) {
        activityIndicator.startAnimating()
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
            self.activityIndicator.stopAnimating()
            
            self.present(Alert.alert, animated: true)
            Alert.body?.text = "Ton idée a été soumise à l'équipe en charge de Polo pour validation, si c'est bon, nous la proposerons dans le futur !"
            Alert.title?.text = "C'est tout bon"
            Alert.button?.setTitle("D'accord", for: .normal)
            Alert.alert.actionButton.addTarget(self, action: #selector(self.closePopup), for: .touchUpInside)
            Alert.alert.ratingStackView.isHidden = true

        }
        
        
    }
    
    @objc func closePopup () {
        self.navigationController?.popViewController(animated: true)
        Alert.alert.dismissSelf()
        
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
