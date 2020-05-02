//
//  PolowersViewController.swift
//  PoloTravel
//
//  Created by SOWA KILLIAN on 18/04/2020.
//  Copyright © 2020 PoloTeam. All rights reserved.
//

import UIKit

class PolowersViewController: UIViewController {
    
    let feedManager = PolowersFeedService()
    var imagePlaceholder = UIImage(named: "onboarding_ready")
    @IBOutlet weak var buttonPublish: BasicButton!
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonPublish.setRedButton()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.backgroundColor = UIColor(white: 1, alpha: 0)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
        
        updateFeed()
    }
    
    func updateFeed() {
        feedManager.updateFeed() {[weak self] (success) in
            guard let `self` = self else { return }
            if (success) {
                self.collectionView.reloadData()
            } else {
                print("notgood")
            }
        }
    }

}

extension PolowersViewController:UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let w = collectionView.frame.width
        let h = collectionView.frame.height
        
        return CGSize(width: w/2-6, height: h/2-6)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 12.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 12.0
    }
    
    
}

extension PolowersViewController:UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        print(indexPath)
    }
}

extension PolowersViewController:UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return feedManager.photoList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PolowersCollectionViewCell", for: indexPath) as! PolowersCollectionViewCell
        
        cell.contentView.layer.cornerRadius = 25.0
        
        cell.polowerNameBkg.layer.cornerRadius = 9.0
        cell.polowerNameBkg.backgroundColor = UIColor(red: 25/255, green: 56/255, blue: 79/255, alpha: 0.8)
        
        cell.imageLikes.text = "\(feedManager.photoList[indexPath.row].likes)"
        cell.polowerName.text = "\(feedManager.photoList[indexPath.row].userName)"
        
        cell.imagePosted?.image = imagePlaceholder
        if let url = URL(string: "\(feedManager.photoList[indexPath.row].imageURL)") {
            cell.imagePosted?.load(url: url)
        }
        
        return cell
    }
    
    
}

