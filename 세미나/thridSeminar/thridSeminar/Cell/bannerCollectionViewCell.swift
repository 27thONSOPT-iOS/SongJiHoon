//
//  bannerCollectionViewCell.swift
//  thridSeminar
//
//  Created by 송지훈 on 2020/10/31.
//

import UIKit

class bannerCollectionViewCell: UICollectionViewCell {
    @IBOutlet weak var bannerImage: UIImageView!
    
    
    func setImage(imageName : String)
    {
        
        self.bannerImage.image = UIImage(named: imageName)
    }
}
