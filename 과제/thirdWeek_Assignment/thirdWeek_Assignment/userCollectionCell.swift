//
//  userCollectionCell.swift
//  thirdWeek_Assignment
//
//  Created by 송지훈 on 2020/11/01.
//

import UIKit

class userCollectionCell: UICollectionViewCell {
    @IBOutlet weak var userImageView: UIImageView!
    
    @IBOutlet weak var userNameTextLabel: UILabel!
    
    @IBOutlet weak var descriptionTextView: UITextView!
    
    
    @IBOutlet weak var nameBar: UIImageView!
    
    
    func settingData(name : String,
                     imageName : String,
                     description : String)
    {
        self.userImageView.image = UIImage(named: imageName)
        self.userNameTextLabel.text = name
        self.descriptionTextView.text = description
        
//        
//        self.descriptionTextView.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        
    }
    
}
