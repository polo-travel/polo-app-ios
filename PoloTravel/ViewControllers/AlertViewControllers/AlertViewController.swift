//
//  AlertViewController.swift
//  PoloTravel
//
//  Created by Nael Messaoudene on 12/05/2020.
//  Copyright © 2020 PoloTeam. All rights reserved.
//

import UIKit

class AlertViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var ratingStackView: UIStackView!
    @IBOutlet weak var bodyLabel: UILabel!
    
    @IBOutlet weak var actionButton: BasicButton!
    
    @IBOutlet weak var popUpView: UIView!
    
    @IBOutlet var buttons: [UIButton]!
    
    var alertTitle = String()
    
    var alertBody = String()
    
    var actionButtonTitle = String()
    
    var buttonAction: (() -> Void)?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

    func setupView() {
        

        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.numberOfLines = 0
        titleLabel.text = alertTitle
         titleLabel.sizeToFit()
        
        bodyLabel.lineBreakMode = .byWordWrapping
        bodyLabel.numberOfLines = 0
        bodyLabel.text = alertBody
        bodyLabel.sizeToFit()

        
        actionButton.setTitle(actionButtonTitle, for: .normal)
        setupCustomPopup()
    }
    
    func setupCustomPopup(){
        popUpView.layer.cornerRadius = 30
        actionButton.setRedButton()
    }
    

   
    @IBAction func didTapActionButton(_ sender: Any) {
        
    guard let button = sender as? UIButton else {
            return
        }

        switch button.tag {
        case 0:
            print("cool")
        case 1:
            print("neutral")
        case 2:
            print("angry")
        default:
            print("Unknown")
            return
        }
        dismiss(animated: true)
        
        buttonAction?()
    }
    
}
