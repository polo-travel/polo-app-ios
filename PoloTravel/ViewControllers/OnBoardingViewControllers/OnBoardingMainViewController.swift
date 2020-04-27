//
//  OnBoardingMainViewController.swift
//  PoloTravel
//
//  Created by SOWA KILLIAN on 27/04/2020.
//  Copyright © 2020 PoloTeam. All rights reserved.
//

import UIKit

class OnBoardingMainViewController: UIViewController {
    
    var pageVC = OnBoardingPageViewController()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "OnBoarding1ViewController" {
            if segue.destination.isKind(of: OnBoardingPageViewController.self) {
                pageVC = segue.destination as! OnBoardingPageViewController
            }
        }
    }
    
    @IBAction func moveFirst(_ sender: Any) {
        pageVC.setViewControllerFromIndex(index: 0)
    }
    
    @IBAction func moveSecond(_ sender: Any) {
        pageVC.setViewControllerFromIndex(index: 1)
    }
    
    @IBAction func moveThird(_ sender: Any) {
        pageVC.setViewControllerFromIndex(index: 2)
    }
    
    @IBAction func moveFourth(_ sender: Any) {
        pageVC.setViewControllerFromIndex(index: 3)
    }
    
    @IBAction func moveFifth(_ sender: Any) {
        pageVC.setViewControllerFromIndex(index: 4)
    }
    
    
    
}
