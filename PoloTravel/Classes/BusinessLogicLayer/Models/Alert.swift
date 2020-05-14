//
//  Alert.swift
//  PoloTravel
//
//  Created by Nael Messaoudene on 14/05/2020.
//  Copyright © 2020 PoloTeam. All rights reserved.
//

import Foundation
import UIKit

struct Alert {
    static var values = ["VALUE 1", "VALUE 222222"]
    
   static var createAlertService = AlertService()
   static var alert = Alert.createAlertService.alert(title: "Bien arrivé ?", body: "C’est parti pour te jeter dans les airs avec « iFLY Lyon » ! \n\n Tu ne trouves pas ? Contacte-les ! 04 82 90 34 70",  buttonTitle: "Je suis bien arrivé"){}
    static var body = Alert.alert.bodyLabel
    static var title = Alert.alert.titleLabel
    static var button = Alert.alert.actionButton
    
}

