//
//  TextBlock.swift
//  PoloTravel
//
//  Created by Nael Messaoudene on 24/04/2020.
//  Copyright © 2020 PoloTeam. All rights reserved.
//

import Foundation
import UIKit

class TextBlockView: UIView {
    
    lazy var contentText: UILabel = {
      let contentText = UILabel()
      contentText.font = UIFont(name: "Gilroy-Medium", size: 16)
      contentText.text = "Moi c’est Polo, ton assistant de voyage!, c’est moi qui vais te surprendre ! \n \nComme tu peux le voir je suis très peu équipé pour partir à l’aventure. Je vais donc te poser quelques questions pour savoir ce que je peux te préparer comme surprise.\n \n Cela te prendra 5 minutes !"
        contentText.lineBreakMode = .byWordWrapping
        contentText.numberOfLines = 0
        contentText.textColor = UIColor.black
        
      contentText.translatesAutoresizingMaskIntoConstraints = false
      return contentText
    }()
    
  lazy var contentView: UIView = {
    let contentView = UIView()

    contentView.addSubview(contentText)
    
    contentView.translatesAutoresizingMaskIntoConstraints = false

    return contentView
  }()
      
    
  lazy var headerTitle: UILabel = {
    let headerTitle = UILabel()
   // headerTitle.font = UIFont.systemFont(ofSize: 35, weight: .bold)
    headerTitle.font = UIFont(name: "Gilroy-Bold", size: 35)
    headerTitle.text = "Hello Cédric"
    headerTitle.textColor = UIColor.black
    headerTitle.translatesAutoresizingMaskIntoConstraints = false
    return headerTitle
  }()
  
  lazy var headerView: UIView = {
    let headerView = UIView()
    headerView.addSubview(headerTitle)
    headerView.translatesAutoresizingMaskIntoConstraints = false
    return headerView
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setupView()

  }
  
  required init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setupView()
  }
  
  private func setupView() {
    backgroundColor = .white
    layer.cornerRadius = 29
    addSubview(contentView)
    addSubview(headerView)
    setupLayout()
  }
  
  private func setupLayout() {
    NSLayoutConstraint.activate([
      //pin headerTitle to headerView
      headerTitle.topAnchor.constraint(equalTo: headerView.topAnchor),
      headerTitle.bottomAnchor.constraint(equalTo: headerView.bottomAnchor),
      headerTitle.leadingAnchor.constraint(equalTo: headerView.leadingAnchor),
      headerTitle.trailingAnchor.constraint(equalTo: headerView.trailingAnchor),
      
      
      //pin headerView to top
      headerView.topAnchor.constraint(equalTo: topAnchor),
      headerView.leadingAnchor.constraint(equalTo: leadingAnchor),
      headerView.trailingAnchor.constraint(equalTo: trailingAnchor),
      headerView.heightAnchor.constraint(equalToConstant: 40),
      
      //layout contentView
      contentView.topAnchor.constraint(equalTo: headerView.bottomAnchor),
      contentView.bottomAnchor.constraint(equalTo: bottomAnchor),
      contentView.leadingAnchor.constraint(equalTo: leadingAnchor),
      contentView.trailingAnchor.constraint(equalTo: trailingAnchor),
      contentView.heightAnchor.constraint(equalTo: contentText.heightAnchor),
      
      // layout contentText
      contentText.widthAnchor.constraint(equalTo: contentView.widthAnchor),
      contentText.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15)
//    contentText.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
//    contentText.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
//    contentText.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: 0)

    ])
  }
    

    override var alignmentRectInsets: UIEdgeInsets {
         return UIEdgeInsets(top: 32, left: 32, bottom: 64, right: 32)
     }
  
  //custom views should override this to return true if
  //they cannot layout correctly using autoresizing.
  //from apple docs https://developer.apple.com/documentation/uikit/uiview/1622549-requiresconstraintbasedlayout
  override class var requiresConstraintBasedLayout: Bool {
    return true
  }
}
