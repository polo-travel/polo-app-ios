//
//  PolowersCommentsViewController.swift
//  PoloTravel
//
//  Created by Nael Messaoudene on 02/06/2020.
//  Copyright © 2020 PoloTeam. All rights reserved.
//

import UIKit

class PolowersCommentsViewController: UIViewController,UINavigationControllerDelegate {

    @IBOutlet weak var img: UIImageView!
    @IBOutlet weak var lbl: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var commentView: UIView!
    @IBOutlet weak var commentViewFirstname: UILabel!
    @IBOutlet weak var commentViewText: UILabel!
    @IBOutlet weak var inputCommentView: UIView!
    @IBOutlet weak var inputComment: UITextField!
    @IBOutlet weak var commentImage: UIImageView!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var postCommentImage: UIImageView!
    
    var name = ""
    var imgURL = ""
    var desc = ""
    var imageId = ""
    var userPhotoURL = ""
    var publicationDate:Date?
    var publicationDateConverted:String? = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loadLastComment()
        commentView.isHidden = true
        
        inputCommentView.frame.origin.y=750
       NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        lbl.text = name
        descriptionLabel.text = desc
        publicationDateConverted = publicationDate?.getFormattedDate(format: "d MMMM")
        dateLabel.text = publicationDateConverted
        
        //Photo postée
        img.sd_setImage(with: URL(string: imgURL), placeholderImage: UIImage(named: "photo.png"))
        img.layer.cornerRadius = 20
        img.clipsToBounds = true
        
        //Photo de profil d'utilisateur en header
        userImage.sd_setImage(with: URL(string: userPhotoURL), placeholderImage: UIImage(named: "photo.png"))
        userImage.layer.cornerRadius = 20
        userImage.clipsToBounds = true
        
        //Photo de profil d'utilisateur à l'ajout de commentaire
        postCommentImage.sd_setImage(with: URL(string: userPhotoURL), placeholderImage: UIImage(named: "photo.png"))
        postCommentImage.layer.cornerRadius = 15
        postCommentImage.clipsToBounds = true

        
    }
    
    @IBAction func postComment(_ sender: Any) {
        if let comment = inputComment.text {
           PolowersCommentService().addComment(imageId: imageId, text: comment) {[weak self] (success) in
               guard let `self` = self else { return }
               if (success) {
                print("commentAdded")
                self.inputComment.text = "Ajouter un commentaire"
                self.loadLastComment()
                self.view.endEditing(true)
               } else {
                   print("commentAdd error")
               }
           }
        }
    }
    
    @IBAction func goBackButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    func loadLastComment() {
        PolowersCommentService().getComments(imageId: imageId) { comments in
            if let comments = comments {
                let commentsConverted = comments.lastObject as! NSDictionary
                self.commentViewFirstname.text = commentsConverted["userFirstName"] as? String
                self.commentViewText.text = commentsConverted["text"] as? String
                
                let commentUserPhotoURL = commentsConverted["userPhoto"] as? String
                
                if let userPhoto = commentUserPhotoURL {
                    self.commentImage.sd_setImage(with: URL(string: userPhoto), placeholderImage: UIImage(named: "photo.png"))
                    self.commentImage.layer.cornerRadius = 15
                    self.commentImage.clipsToBounds = true
                }
                
            
                self.commentView.isHidden = false
            }
        }
    }
    
    @IBAction func seeAllComments(_ sender: Any) {
        self.performSegue(withIdentifier: "toCommentDetail", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toCommentDetail" {
            if let dest = segue.destination as? PolowersAllCommentsViewController {
                dest.imageId = self.imageId
                dest.publicationDate = self.publicationDateConverted ?? ""
                dest.name = self.name
                dest.desc = self.desc
                dest.userPhotoURL = self.userPhotoURL
            }
        }
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
        print("keyboard shown")
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            if self.inputCommentView.frame.origin.y == 750 {
                self.inputCommentView.frame.origin.y -= (keyboardSize.height-(self.tabBarController?.tabBar.frame.height ?? 49))
            }
        }
    }

    @objc func keyboardWillHide(notification: NSNotification) {
        if self.inputCommentView.frame.origin.y != 750 {
            self.inputCommentView.frame.origin.y = 750
        }
    }
    
}
