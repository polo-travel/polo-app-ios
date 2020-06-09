//
//  PolowersAddPhotoViewController.swift
//  PoloTravel
//
//  Created by SOWA KILLIAN on 19/04/2020.
//  Copyright © 2020 PoloTeam. All rights reserved.
//

import UIKit
import Firebase
import FirebaseStorage
import AppCenterAnalytics

class PolowersAddPhotoViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var currentImage: UIImageView!
    @IBOutlet weak var inputDescription: UITextView!
    @IBOutlet weak var buttonPublish: BasicButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    let imagesManager = PolowersImagesService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        
        buttonPublish.setRedButton()
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(addNewPerson))
        currentImage.addGestureRecognizer(tap)
        currentImage.isUserInteractionEnabled = true
        
        currentImage.backgroundColor = UIColor(red: 25/255, green: 56/255, blue: 79/255, alpha: 0.8)
        currentImage.layer.cornerRadius = 12.0
        inputDescription.layer.cornerRadius = 12.0
        inputDescription.backgroundColor = UIColor(white: 1, alpha: 0.9)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    @objc func addNewPerson() {
        let picker = UIImagePickerController()
        picker.allowsEditing = true
        picker.delegate = self
        present(picker, animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else { return }

        let imageName = UUID().uuidString
        let imagePath = getDocumentsDirectory().appendingPathComponent(imageName)

        if let jpegData = image.jpegData(compressionQuality: 0.8) {
            try? jpegData.write(to: imagePath)
        }
        
        dismiss(animated: true)
        
        currentImage.image = image
    }
    
    @IBAction func publishButtonClicked(_ sender: Any) {
        activityIndicator.startAnimating()
        
        if let currentImage = currentImage.image {
            imagesManager.addImageToDatabase(inputDescription: inputDescription, imgToUpload: currentImage) {[weak self] (success) in
                    guard let `self` = self else { return }
                    if (success) {
                        self.activityIndicator.stopAnimating()
                        MSAnalytics.trackEvent("Polowers photo published")
                        self.navigationController?.popViewController(animated: true)
                    } else {
                        self.activityIndicator.stopAnimating()
                    }
                }
        }
    }
    
    @IBAction func buttonBackClicked(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    

    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }


}
