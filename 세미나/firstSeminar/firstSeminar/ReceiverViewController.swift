//
//  ReceiverViewController.swift
//  firstSeminar
//
//  Created by 송지훈 on 2020/10/10.
//

import UIKit

class ReceiverViewController: UIViewController {

    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var onOffLabel: UILabel!
    
    @IBOutlet weak var countLabel: UILabel!
    var email: String = ""
    var isOnOff : String = ""
    var count : Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setLabel()
        
        
    }
    
    func setLabel()
    {
        
        
        
        self.emailLabel.text = email
        self.emailLabel.sizeToFit()
        
        self.onOffLabel.text = isOnOff
        self.onOffLabel.sizeToFit()
        
        self.countLabel.text = String(count)
        self.countLabel.sizeToFit()

    }

    @IBAction func backButtonClicked(_ sender: Any) {
        
        self.dismiss(animated: true, completion:    nil)
    }
    
}
