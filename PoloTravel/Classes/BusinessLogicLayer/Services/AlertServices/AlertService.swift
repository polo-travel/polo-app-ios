//
//  AlertService.swift
//  PoloTravel
//
//  Created by Nael Messaoudene on 12/05/2020.
//  Copyright © 2020 PoloTeam. All rights reserved.
//

import Foundation
import UIKit

class AlertService {
    
    func alert(title: String, body: String, buttonTitle: String, completion: @escaping () -> Void) -> AlertViewController {
        
        let storyboard = UIStoryboard(name: "AlertStoryboard", bundle: .main)
        
        let alertVC = storyboard.instantiateViewController(withIdentifier: "AlertVC") as! AlertViewController
        
        alertVC.alertTitle = title
        
        alertVC.alertBody = body
        
        alertVC.actionButtonTitle = buttonTitle
        
        alertVC.buttonAction = completion
        
        return alertVC
    }
    
}
