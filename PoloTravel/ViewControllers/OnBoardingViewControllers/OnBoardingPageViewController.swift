//
//  OnBoardingPageViewController.swift
//  PoloTravel
//
//  Created by SOWA KILLIAN on 27/04/2020.
//  Copyright © 2020 PoloTeam. All rights reserved.
//

import UIKit

class OnBoardingPageViewController: UIPageViewController {
    
    lazy var subViewControllers:[UIViewController] = {
        return [
            UIStoryboard(name: "OnBoarding", bundle: nil).instantiateViewController(withIdentifier: "OnBoarding1ViewController") as! OnBoarding1ViewController,
            UIStoryboard(name: "OnBoarding", bundle: nil).instantiateViewController(withIdentifier: "OnBoarding2ViewController") as! OnBoarding2ViewController,
            UIStoryboard(name: "OnBoarding", bundle: nil).instantiateViewController(withIdentifier: "OnBoarding3ViewController") as! OnBoarding3ViewController,
            UIStoryboard(name: "OnBoarding", bundle: nil).instantiateViewController(withIdentifier: "OnBoarding4ViewController") as! OnBoarding4ViewController,
            UIStoryboard(name: "OnBoarding", bundle: nil).instantiateViewController(withIdentifier: "OnBoarding5ViewController") as! OnBoarding5ViewController,
        ]
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        delegate = self
        setViewControllerFromIndex(index: 0)
    }
    
    func setViewControllerFromIndex(index: Int) {
        self.setViewControllers([subViewControllers[index]], direction: UIPageViewController.NavigationDirection.forward, animated: true, completion: nil)
    }

}

extension OnBoardingPageViewController: UIPageViewControllerDelegate, UIPageViewControllerDataSource  {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        let currentIndex:Int = subViewControllers.firstIndex(of: viewController) ?? 0
        if currentIndex <= 0 {
            return nil
        }
        return subViewControllers[currentIndex-1]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        let currentIndex:Int = subViewControllers.firstIndex(of: viewController) ?? 0
        print("currentIndex", currentIndex)
        if currentIndex >= subViewControllers.count-1 {
            return nil
        }
        return subViewControllers[currentIndex+1]
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return subViewControllers.count
    }
}
