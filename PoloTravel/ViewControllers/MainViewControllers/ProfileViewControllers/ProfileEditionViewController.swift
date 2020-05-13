//
//  ProfileEditionViewController.swift
//  PoloTravel
//
//  Created by SOWA KILLIAN on 02/05/2020.
//  Copyright © 2020 PoloTeam. All rights reserved.
//

import UIKit

class ProfileEditionViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    @IBOutlet weak var buttonBack: UIButton!
    @IBOutlet weak var lastNameInput: UITextField!
    @IBOutlet weak var firstNameInput: UITextField!
    @IBOutlet weak var emailInput: UITextField!
    @IBOutlet weak var passwordInput: UILabel!
    @IBOutlet weak var buttonConfirm: BasicButton!
    @IBOutlet weak var profilePhoto: RoundedImage!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var infoLabel: UILabel!
    
    var user:User?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        buttonConfirm.setDarkButton()
        
        UserService().currentUser() { result  in
            self.user = result
            
            if let profilePhoto = self.user?.photoURL {
                self.profilePhoto.sd_setImage(with: URL(string: profilePhoto), placeholderImage: UIImage(named: "photo.png"))
            }
            
            self.firstNameInput.text = "\(String(self.user?.firstName ?? ""))"
            self.lastNameInput.text = "\(String(self.user?.lastName ?? ""))"
            self.emailInput.text = "\(String(self.user?.email ?? ""))"
        }
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(addNewPerson))
        profilePhoto.addGestureRecognizer(tap)
        profilePhoto.isUserInteractionEnabled = true
        
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
        
        profilePhoto.image = image
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)

    }

    @IBAction func buttonConfirmClicked(_ sender: Any) {
        self.infoLabel.text = ""
        
        activityIndicator.startAnimating()
        if let email = emailInput.text, let password = passwordInput.text, let firstname = firstNameInput.text, let lastname = lastNameInput.text {
            UserService().updateProfile(firstname: firstname, lastname: lastname, email: email, password: password, imgToUpload: profilePhoto.image) {[weak self] (success) in
                guard let `self` = self else { return }
                if (success) {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                        self.activityIndicator.stopAnimating()
                        self.infoLabel.text = "C'est tout bon !"
                    }
                    
                } else {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) {
                        self.activityIndicator.stopAnimating()
                        self.infoLabel.text = "Tu as fait une erreur !"
                    }
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

