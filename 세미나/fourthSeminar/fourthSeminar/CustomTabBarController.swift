//
//  TabBarController.swift
//  fourthSeminar
//
//  Created by 송지훈 on 2020/11/07.
//

import UIKit

class CustomTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        setTabbar()
        self.navigationController?.navigationBar.isHidden = true

    }
    

    
    
    func setTabbar()
    {
        guard let personVC = self.storyboard?.instantiateViewController(identifier: "PersonViewController") as? PersonViewController,
            let houseVC = self.storyboard?.instantiateViewController(identifier: "HouseViewController") as? HouseViewController
              else {return}
        
        
        personVC.tabBarItem.title = "살함"
        personVC.tabBarItem.image = UIImage(systemName: "person")
        personVC.tabBarItem.selectedImage = UIImage(systemName:"person.fill")
        
        houseVC.tabBarItem.title = "하우스"
        houseVC.tabBarItem.image = UIImage(systemName: "house")
        houseVC.tabBarItem.selectedImage = UIImage(systemName:"house.fill")
        
        setViewControllers([personVC,houseVC], animated: true)
        
        
    }

}
