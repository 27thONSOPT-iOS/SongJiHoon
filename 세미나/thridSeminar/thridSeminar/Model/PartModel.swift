//
//  PartModel.swift
//  thridSeminar
//
//  Created by 송지훈 on 2020/10/31.
//

import Foundation
import UIKit


struct Part{
    
    var partName : String
    var imageName : String
    
    func makeImage() -> UIImage?
    {
        return UIImage(named: imageName)
    }
}
