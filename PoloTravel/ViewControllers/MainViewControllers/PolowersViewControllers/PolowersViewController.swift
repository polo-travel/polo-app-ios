//
//  PolowersViewController.swift
//  PoloTravel
//
//  Created by SOWA KILLIAN on 18/04/2020.
//  Copyright © 2020 PoloTeam. All rights reserved.
//

import UIKit

class PolowersViewController: UIViewController {
    
    var photoList:Photo = []
    var imagePlaceholder = UIImage(named: "onboarding_ready")
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        
        photoList = [
            PhotoElement(imageURL: "https://geo.img.pmdstatic.net/fit/http.3A.2F.2Fprd2-bone-image.2Es3-website-eu-west-1.2Eamazonaws.2Ecom.2Fgeo.2F2020.2F03.2F16.2F217d2f8d-ce31-4ef9-a08a-0eeb9efba706.2Ejpeg/1120x630/background-color/ffffff/quality/70/les-plus-belles-photos-de-nature-capturees-dans-les-parcs-nationaux-du-royaume-uni.jpg", poster: "Cédric", likes: 0),
            PhotoElement(imageURL: "https://geo.img.pmdstatic.net/fit/http.3A.2F.2Fprd2-bone-image.2Es3-website-eu-west-1.2Eamazonaws.2Ecom.2Fgeo.2F2020.2F03.2F16.2F217d2f8d-ce31-4ef9-a08a-0eeb9efba706.2Ejpeg/1120x630/background-color/ffffff/quality/70/les-plus-belles-photos-de-nature-capturees-dans-les-parcs-nationaux-du-royaume-uni.jpg", poster: "Alexia", likes: 15),
            PhotoElement(imageURL: "https://geo.img.pmdstatic.net/fit/http.3A.2F.2Fprd2-bone-image.2Es3-website-eu-west-1.2Eamazonaws.2Ecom.2Fgeo.2F2020.2F03.2F16.2F217d2f8d-ce31-4ef9-a08a-0eeb9efba706.2Ejpeg/1120x630/background-color/ffffff/quality/70/les-plus-belles-photos-de-nature-capturees-dans-les-parcs-nationaux-du-royaume-uni.jpg", poster: "Manon", likes: 500),
            PhotoElement(imageURL: "https://geo.img.pmdstatic.net/fit/http.3A.2F.2Fprd2-bone-image.2Es3-website-eu-west-1.2Eamazonaws.2Ecom.2Fgeo.2F2020.2F03.2F16.2F217d2f8d-ce31-4ef9-a08a-0eeb9efba706.2Ejpeg/1120x630/background-color/ffffff/quality/70/les-plus-belles-photos-de-nature-capturees-dans-les-parcs-nationaux-du-royaume-uni.jpg", poster: "Lucas", likes: 30),
        ]
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }

}

extension PolowersViewController:UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let w = collectionView.frame.width
        let h = collectionView.frame.height
        
        return CGSize(width: w/2, height: h/2)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        
        return 0.0
    }
    
    
}

extension PolowersViewController:UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        print(indexPath)
    }
}

extension PolowersViewController:UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.photoList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PolowersCollectionViewCell", for: indexPath) as! PolowersCollectionViewCell
        
        cell.imageLikes.text = "\(photoList[indexPath.row].likes)"
        cell.polowerName.text = "\(photoList[indexPath.row].poster)"
        
        cell.imagePosted?.image = imagePlaceholder
        if let url = URL(string: "\(photoList[indexPath.row].imageURL)") {
            cell.imagePosted?.load(url: url)
        }
        
        return cell
    }
    
    
}

