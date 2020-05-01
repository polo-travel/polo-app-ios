//
//  Step1TravelCreationViewController.swift
//  PoloTravel
//
//  Created by Nael Messaoudene on 27/04/2020.
//  Copyright © 2020 PoloTeam. All rights reserved.
//
import Foundation
import UIKit

class Step1TravelCreationViewController: UIViewController {

    var rotationAngle : CGFloat!
    @IBOutlet weak var poloCharacters: UIImageView!
    
    var index = 0
    let animationDuration: TimeInterval = 0.25
    let switchingInterval: TimeInterval = 3
    
    @IBOutlet weak var picker: UIPickerView!
    let data = ["1","2","3","4","5","6"]
    
    let imgArray = ["polo_travelers_1","polo_travelers_2","polo_travelers_3","polo_travelers_4","polo_travelers_5","polo_travelers_6"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        rotationAngle = -90 * (.pi / 180 )

        rotatePickerView(pickerView: picker)
        picker.delegate = self
        picker.dataSource = self
        // Do any additional setup after loading the view.
    }
    

       func rotatePickerView(pickerView : UIPickerView) {
        let y = pickerView.frame.origin.y
        let x = pickerView.frame.origin.x

        pickerView.transform = CGAffineTransform(rotationAngle: rotationAngle)
        pickerView.frame = CGRect(x: x, y: y, width: pickerView.frame.height , height: pickerView.frame.width)
    }
    

}
extension Step1TravelCreationViewController:UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
      
       pickerView.subviews.forEach({
           $0.isHidden = $0.frame.height < 1.0
       })
       return 1
    }
    
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return data.count
    }
}

extension Step1TravelCreationViewController:UIPickerViewDelegate{
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        return data[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
        let label = UILabel()
        label.font = UIFont(name: "Gilroy-Bold", size: 120)
        label.textColor = UIColor.MainTheme.mainDarkBlue
        label.minimumScaleFactor = 0.5
        label.textAlignment = .center
        label.transform = CGAffineTransform(rotationAngle: 90 * (.pi / 180 ))

        label.text = data[row]

        return label
    }

    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        80
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {        
        if data[row] == data[row] {
            print(data[row])
             UIView.transition(with: self.poloCharacters,
                            duration: 0.7,
                            options: .transitionCrossDissolve,
                            animations: {
                            self.poloCharacters.image = self.poloCharacters.image
                        },completion: nil)
            poloCharacters.image = UIImage(named: "polo_travelers_\(data[row])")
        }
        
    }
    
}
