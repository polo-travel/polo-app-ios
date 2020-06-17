//
//  ProfileViewController.swift
//  PoloTravel
//
//  Created by SOWA KILLIAN on 18/04/2020.
//  Copyright © 2020 PoloTeam. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var buttonEditProfile: BasicButton!
    @IBOutlet weak var firstNameLabel: UILabel!
    @IBOutlet weak var nextTravelDate: UILabel!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var typeAventurerLabel: UILabel!
    @IBOutlet weak var buttonKnowMore: UIButton!
    @IBOutlet weak var profilePhoto: RoundedImage!
    @IBOutlet weak var travelsHistory: RadiusBlock!
    @IBOutlet weak var travlesHistoryLabel: UILabel!
    @IBOutlet weak var travelTitleLabel: UILabel!
    var user:User?
    
    var transparentView = UIView()
    var tableView = UITableView()
    
    let height: CGFloat = 200
    
    var settingArray = ["","Se déconnecter","Annuler", ""]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.isScrollEnabled = true
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(ProfileMenuTableViewCell.self, forCellReuseIdentifier: "Cell")
        tableView.backgroundColor = UIColor.MainTheme.mainDarkBlue
        
        buttonEditProfile.setRedButton()
        buttonEditProfile.titleLabel?.font = UIFont(name: "Gilroy-Medium", size: 14)
        buttonKnowMore.isHidden = true
        travelsHistory.isHidden = true
        
        activityIndicator.startAnimating()
    }
    
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        UserService().currentUser() { result  in
            self.user = result
            
            let formatter = DateFormatter()
            formatter.dateFormat = "dd.MM"
            
            TravelService().pastTravels() { result in
                if let pastTravels = result {
                    if pastTravels.count > 0 {
                        self.travelsHistory.isHidden = false
                        print("PROFILE: \(pastTravels.count) past travels")
                    } else {
                        print("PROFILE: No past travels")
                    }
                } else {
                    print("PROFILE: No past travels")
                }
                
            }
            
            TravelService().nextTravel() { result in
                if let nextTravel = result {
                    let startDate = formatter.string(from: nextTravel.startDate)
                    let endDate = formatter.string(from: nextTravel.endDate)
            
                    if let url = self.user?.photoURL {
                        print("url", url)
                        self.profilePhoto.sd_setImage(with: URL(string: url), placeholderImage: UIImage(named: "photo.png"))
                    } else {
                        print("Profile: No photo URL")
                    }
                    self.travelTitleLabel.fadeTransition(0.4)
                    if nextTravel.gift == true {
                        self.travelTitleLabel.text = "Voyage offert"
                    } else {
                        self.travelTitleLabel.text = "Mon prochain voyage"
                    }
                    self.activityIndicator.stopAnimating()
                    self.nextTravelDate.text = "Du \(startDate) au \(endDate)"
                    self.typeAventurerLabel.text = "Aventurier expert"
                    self.buttonKnowMore.isHidden = false
                } else {
                    self.activityIndicator.stopAnimating()
                    self.nextTravelDate.text = "Aucun voyage prévu"
                    self.typeAventurerLabel.text = ""
                }
            }
            
            self.firstNameLabel.text = "\(String(self.user?.firstName ?? "")) \(String(self.user?.lastName ?? ""))"
        }
        
        // Hide the navigation bar on the this view controller
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
   
    @IBAction func buttonSettings(_ sender: Any) {
        let window = UIApplication.shared.keyWindow
        transparentView.backgroundColor = UIColor.black.withAlphaComponent(0.9)
        transparentView.frame = self.view.frame
        window?.addSubview(transparentView)
        
        let screenSize = UIScreen.main.bounds.size
        print("screenSize", screenSize)
        tableView.frame = CGRect(x: 0, y: screenSize.height, width: screenSize.width, height: height)
        window?.addSubview(tableView)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(onClickTransparentView))
        transparentView.addGestureRecognizer(tapGesture)
        
        transparentView.alpha = 0
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {
            self.transparentView.alpha = 0.5
            self.tableView.frame = CGRect(x: 0, y: screenSize.height - self.height, width: screenSize.width, height: self.height)
        }, completion: nil)
    }
    
    @objc func onClickTransparentView() {
        let screenSize = UIScreen.main.bounds.size

        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {
            self.transparentView.alpha = 0
            self.tableView.frame = CGRect(x: 0, y: screenSize.height, width: screenSize.width, height: self.height)
        }, completion: nil)
    }
    
}

extension ProfileViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingArray.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 1 {
            AuthentificationService().signOut {[weak self] (success) in
                guard let `self` = self else { return }
                if (success) {
                    let sign =  UIStoryboard(name: "SignIn", bundle: nil)
                    let vc = sign.instantiateViewController(withIdentifier: "ViewController")
                    exit(0);
                    print("logoutsuccess")
                } else {
                    print("logout fail")
                }
            }
        }
        
        if indexPath.row == 2 {
            onClickTransparentView()
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? ProfileMenuTableViewCell else {fatalError("Unable to deque cell")}
        cell.lbl.text = settingArray[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    
}
