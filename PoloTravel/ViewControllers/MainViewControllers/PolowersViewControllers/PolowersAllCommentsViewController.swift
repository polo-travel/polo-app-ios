//
//  PolowersAllCommentsViewController.swift
//  PoloTravel
//
//  Created by Nael Messaoudene on 06/06/2020.
//  Copyright © 2020 PoloTeam. All rights reserved.
//

import UIKit

class PolowersAllCommentsViewController: UIViewController {

    @IBOutlet weak var inputCommentView: UIView!
    @IBOutlet weak var commentsTableView: UITableView!
    @IBOutlet weak var labelFirstname: UILabel!
    @IBOutlet weak var labelDate: UILabel!
    @IBOutlet weak var labelDesc: UILabel!
    var commentsList:[NSDictionary] = []
    var imageId = ""
    var name = ""
    var imgURL = ""
    var desc = ""
    var publicationDate =  ""
    @IBOutlet weak var inputComment: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

       self.hideKeyboardWhenTappedAround()
        commentsTableView.delegate = self
        commentsTableView.dataSource = self
        
        labelFirstname.text = name
        labelDate.text = publicationDate
        labelDesc.text = desc
        
        
        self.loadComments()
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
         NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    @IBAction func goBack(_ sender: UIButton) {
                self.navigationController?.popViewController(animated: true)
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
    
    @IBAction func postComment(_ sender: Any) {
        if let comment = inputComment.text {
           PolowersCommentService().addComment(imageId: imageId, text: comment) {[weak self] (success) in
               guard let `self` = self else { return }
               if (success) {
                self.loadComments()
               } else {
                   print("commentsTableViewreload failed")
               }
           }
            
        }
        
    }
    
    
    func loadComments() {
        PolowersCommentService().getComments(imageId: imageId) { comments in
            self.commentsList = []
            comments?.forEach{ comment in
                self.commentsList.append(comment as! NSDictionary)
            }
            self.commentsTableView.reloadData()
        }
    }

}

extension PolowersAllCommentsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return commentsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "PolowersCommentTableViewCell", for: indexPath) as! PolowersCommentTableViewCell
        
        cell.firstnameLabel.text = commentsList[indexPath.row]["userFirstName"] as? String
        cell.commentLabel.text = commentsList[indexPath.row]["text"] as? String
        
        
        return cell
    }
    
    
}

extension PolowersAllCommentsViewController:UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("ToTO \(indexPath.row)")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 64
    }
}
