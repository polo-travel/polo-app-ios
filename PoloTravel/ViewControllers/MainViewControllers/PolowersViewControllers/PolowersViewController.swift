//
//  PolowersViewController.swift
//  PoloTravel
//
//  Created by SOWA KILLIAN on 18/04/2020.
//  Copyright © 2020 PoloTeam. All rights reserved.
//

import UIKit
import SDWebImage

class PolowersViewController: UIViewController {
    
    let feedManager = PolowersFeedService()
    var imagePlaceholder = UIImage(named: "onboarding_ready")
    @IBOutlet weak var searchBar: UISearchBar!
    
    @IBOutlet weak var collectionView: UICollectionView!
    var transparentView = UIView()
    @IBOutlet weak var menuView: UIView!
    
    let height: CGFloat = 209
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        menuView.roundCorners([.topLeft, .topRight], radius: 35)
        collectionView.backgroundColor = UIColor(white: 1, alpha: 0)
        let screenSize = UIScreen.main.bounds.size
        self.menuView.frame = CGRect(x: 0, y: screenSize.height, width: screenSize.width, height: self.height)
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
    
    @IBAction func buttonMenuClicked(_ sender: Any) {
        let window = UIApplication.shared.keyWindow
        transparentView.backgroundColor = UIColor.MainTheme.mainDarkBlue.withAlphaComponent(0.9)
        transparentView.frame = self.view.frame
        window?.addSubview(transparentView)
        
        let screenSize = UIScreen.main.bounds.size
        menuView.frame = CGRect(x: 0, y: screenSize.height, width: screenSize.width, height: height)
        window?.addSubview(menuView)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onClickTransparentView))
        transparentView.addGestureRecognizer(tapGesture)
        
        transparentView.alpha = 0
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {
            self.transparentView.alpha = 0.4
            self.menuView.frame = CGRect(x: 0, y: screenSize.height - self.height, width: screenSize.width, height: self.height)
        }, completion: nil)
        
    }
    
    @IBAction func buttonProposeClicked(_ sender: Any) {
        closeMenuView()
    }
    
    @IBAction func buttonCancelClicked(_ sender: Any) {
        closeMenuView()
    }
    
    @IBAction func buttonPublishClicked(_ sender: Any) {
        closeMenuView()
    }
    
    @objc func onClickTransparentView() {
        closeMenuView()
    }
    
    func closeMenuView() {
        let screenSize = UIScreen.main.bounds.size

        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {
            self.transparentView.alpha = 0
            self.menuView.frame = CGRect(x: 0, y: screenSize.height, width: screenSize.width, height: self.height)
        }, completion: nil)
    }
    

}

extension PolowersViewController:UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let w = collectionView.frame.width
        let h = collectionView.frame.height
        
        return CGSize(width: w/2-6, height: h/3-8)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 12.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 12.0
    }
    
    
}

extension PolowersViewController:UICollectionViewDataSource, UICollectionViewDelegate {
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
            cell.imagePosted?.sd_setImage(with: URL(string: url.absoluteString), placeholderImage: UIImage(named: "photo.png"))
        }
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//       p§rint("item at \(indexPath.section)/\(indexPath.item) tapped")
                let vc = storyboard?.instantiateViewController(withIdentifier: "PolowersCommentsViewController") as? PolowersCommentsViewController
                vc?.name = feedManager.photoList[indexPath.row].userName
        
                print(indexPath)
                print("okok",indexPath)
        
                self.navigationController?.pushViewController(vc!, animated: true)
     }
    
//    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
//
//        let vc = storyboard?.instantiateViewController(withIdentifier: "PolowersCommentsViewController") as? PolowersCommentsViewController
//        vc?.name = feedManager.photoList[indexPath.row].userName
//
//        print(indexPath)
//        print("okok",indexPath)
//
//        self.navigationController?.pushViewController(vc!, animated: true)
//    }

    
}

extension UIView {

    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
         let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
         let mask = CAShapeLayer()
         mask.path = path.cgPath
         self.layer.mask = mask
    }

}


