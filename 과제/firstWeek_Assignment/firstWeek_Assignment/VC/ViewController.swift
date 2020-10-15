//
//  ViewController.swift
//  firstWeek_Assignment
//
//  Created by 송지훈 on 2020/10/15.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var partTitleLabel: UILabel!
    
    @IBOutlet weak var partLabel: UILabel!
    
    @IBOutlet weak var welcomeMessageLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addObserver()
        
        
        self.partTitleLabel.isHidden = true
        self.partLabel.isHidden = true
        self.welcomeMessageLabel.isHidden = true
    
    }
    
    
    
    func addObserver()
    {
        NotificationCenter.default.addObserver(self, selector: #selector(settingLabel), name: NSNotification.Name("dataReceived"), object:  nil)
    }

    @objc func settingLabel(_ noti : NSNotification)
    {
        let dataList = noti.object as? [String] ?? []
        
        self.partTitleLabel.isHidden = false
        self.partLabel.isHidden = false
        self.welcomeMessageLabel.isHidden = false
        
        self.partLabel.text = dataList[0]
        self.welcomeMessageLabel.text = "\(dataList[1]) 님 안녕하세여 ^~^"
    }
    

    @IBAction func loginButtonClicked(_ sender: Any) {

        

        guard let loginVC = self.storyboard?.instantiateViewController(identifier: "loginNavi") else {return}

        loginVC.modalPresentationStyle = .fullScreen

        self.present(loginVC, animated: true, completion: nil)
        
    }
    
}

