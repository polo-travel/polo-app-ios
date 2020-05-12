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
    
    @IBOutlet weak var bodyLabel: UILabel!
    
    @IBOutlet weak var actionButton: UIButton!
    
    var alertTitle = String()
    
    var alertBody = String()
    
    var actionButtonTitle = String()
    
    var buttonAction: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setupView()
    }

    func setupView() {
        
        titleLabel.text = alertTitle
        
        bodyLabel.text = alertBody
        
        actionButton.setTitle(actionButtonTitle, for: .normal)
    }
    
    @IBAction func didTapCancel(_ sender: Any) {
        
        dismiss(animated: true)
    }
    
    
    @IBAction func didTapActionButton(_ sender: Any) {
        
        dismiss(animated: true)
        
        buttonAction?()
    }
    
}
