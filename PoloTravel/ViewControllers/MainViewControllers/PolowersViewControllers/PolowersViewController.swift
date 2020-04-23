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
        
        collectionView.backgroundColor = UIColor(white: 1, alpha: 0)
        
        photoList = [
            PhotoElement(imageURL: "https://geo.img.pmdstatic.net/fit/http.3A.2F.2Fprd2-bone-image.2Es3-website-eu-west-1.2Eamazonaws.2Ecom.2Fgeo.2F2020.2F03.2F16.2F217d2f8d-ce31-4ef9-a08a-0eeb9efba706.2Ejpeg/1120x630/background-color/ffffff/quality/70/les-plus-belles-photos-de-nature-capturees-dans-les-parcs-nationaux-du-royaume-uni.jpg", poster: "Cédric", likes: 0),
            PhotoElement(imageURL: "https://geo.img.pmdstatic.net/fit/http.3A.2F.2Fprd2-bone-image.2Es3-website-eu-west-1.2Eamazonaws.2Ecom.2Fgeo.2F2020.2F03.2F16.2F217d2f8d-ce31-4ef9-a08a-0eeb9efba706.2Ejpeg/1120x630/background-color/ffffff/quality/70/les-plus-belles-photos-de-nature-capturees-dans-les-parcs-nationaux-du-royaume-uni.jpg", poster: "Alexia", likes: 15),
            PhotoElement(imageURL: "https://geo.img.pmdstatic.net/fit/http.3A.2F.2Fprd2-bone-image.2Es3-website-eu-west-1.2Eamazonaws.2Ecom.2Fgeo.2F2020.2F03.2F16.2F217d2f8d-ce31-4ef9-a08a-0eeb9efba706.2Ejpeg/1120x630/background-color/ffffff/quality/70/les-plus-belles-photos-de-nature-capturees-dans-les-parcs-nationaux-du-royaume-uni.jpg", poster: "Manon", likes: 500),
            PhotoElement(imageURL: "https://geo.img.pmdstatic.net/fit/http.3A.2F.2Fprd2-bone-image.2Es3-website-eu-west-1.2Eamazonaws.2Ecom.2Fgeo.2F2020.2F03.2F16.2F217d2f8d-ce31-4ef9-a08a-0eeb9efba706.2Ejpeg/1120x630/background-color/ffffff/quality/70/les-plus-belles-photos-de-nature-capturees-dans-les-parcs-nationaux-du-royaume-uni.jpg", poster: "Lucas", likes: 30),
            PhotoElement(imageURL: "https://geo.img.pmdstatic.net/fit/http.3A.2F.2Fprd2-bone-image.2Es3-website-eu-west-1.2Eamazonaws.2Ecom.2Fgeo.2F2020.2F03.2F16.2F217d2f8d-ce31-4ef9-a08a-0eeb9efba706.2Ejpeg/1120x630/background-color/ffffff/quality/70/les-plus-belles-photos-de-nature-capturees-dans-les-parcs-nationaux-du-royaume-uni.jpg", poster: "Manon", likes: 500),
            PhotoElement(imageURL: "https://geo.img.pmdstatic.net/fit/http.3A.2F.2Fprd2-bone-image.2Es3-website-eu-west-1.2Eamazonaws.2Ecom.2Fgeo.2F2020.2F03.2F16.2F217d2f8d-ce31-4ef9-a08a-0eeb9efba706.2Ejpeg/1120x630/background-color/ffffff/quality/70/les-plus-belles-photos-de-nature-capturees-dans-les-parcs-nationaux-du-royaume-uni.jpg", poster: "Lucas", likes: 30),
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
        return self.photoList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "PolowersCollectionViewCell", for: indexPath) as! PolowersCollectionViewCell
    
        
        cell.contentView.layer.cornerRadius = 25.0
        
        cell.imageLikesBkg.backgroundColor = UIColor(patternImage: UIImage(named: "heart.png")!)
        cell.polowerNameBkg.layer.cornerRadius = 9.0
        cell.polowerNameBkg.backgroundColor = UIColor(red: 25/255, green: 56/255, blue: 79/255, alpha: 0.8)
        
        cell.imageLikes.text = "\(photoList[indexPath.row].likes)"
        cell.polowerName.text = "\(photoList[indexPath.row].poster)"
        
        cell.imagePosted?.image = imagePlaceholder
        if let url = URL(string: "\(photoList[indexPath.row].imageURL)") {
            cell.imagePosted?.load(url: url)
        }
        
        return cell
    }
    
    
}

