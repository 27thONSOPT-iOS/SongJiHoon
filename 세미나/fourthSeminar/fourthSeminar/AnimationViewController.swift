//
//  AnimationViewController.swift
//  fourthSeminar
//
//  Created by 송지훈 on 2020/11/07.
//

import UIKit

class AnimationViewController: UIViewController {

    @IBOutlet weak var circleImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    func initPosition()
    {
        self.circleImageView.frame = CGRect(x: 0, y: 50, width: 100, height: 100)
    }
    
    @IBAction func buttonClicked(_ sender: Any) {
        
       
        let newposition = CGRect(x: 0, y: 200, width: 100, height: 100)
        
        
        UIView.animate(withDuration: 3.0, animations:{
            
            self.circleImageView.frame = newposition
            
            
            
            
        }) { finished in
            
            UIView.animate(withDuration: 1.0) {
                
                self.initPosition()
//                self.circleImageView.alpha = 1
            }
    
        }
    }
    

}
