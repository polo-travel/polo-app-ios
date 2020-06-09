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
    

    @IBOutlet weak var commentImage: UIImageView!
    @IBOutlet weak var userImage: UIImageView!
    var name = ""
    var imgURL = ""
    var desc = ""
    var imageId = ""
    var publicationDate:Date?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(imgURL)
        
        lbl.text = name
        descriptionLabel.text = desc
        dateLabel.text = publicationDate?.getFormattedDate(format: "d MMMM")
        
        img.sd_setImage(with: URL(string: imgURL), placeholderImage: UIImage(named: "photo.png"))
        img.layer.cornerRadius = 20
               img.clipsToBounds = true
        
        userImage.sd_setImage(with: URL(string: imgURL), placeholderImage: UIImage(named: "photo.png"))
        userImage.layer.cornerRadius = 20
        userImage.clipsToBounds = true
        
        
        commentImage.sd_setImage(with: URL(string: imgURL), placeholderImage: UIImage(named: "photo.png"))
              commentImage.layer.cornerRadius = 20
              commentImage.clipsToBounds = true

    }
    
    
    @IBAction func addCommentClicked(_ sender: Any) {
      PolowersCommentService().addComment(imageId: imageId, text: "testcommentaire")
    }
    

    @IBAction func goBackButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
