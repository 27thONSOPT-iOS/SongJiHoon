//
//  HomeViewController.swift
//  fourthWeek_Assignment
//
//  Created by 송지훈 on 2020/11/13.
//

import UIKit

class HomeViewController: UIViewController {

    
    //MARK:- IBOutlet Part
    
    @IBOutlet weak var partTitleTextLabel: UILabel!
    @IBOutlet weak var partNameTextLabel: UILabel!
    @IBOutlet weak var welcomeNameTextLabel: UILabel!
    //MARK:- Variable Part

   //MARK:- Constraint Part
    

    //MARK:- Life Cycle Part
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hidelabel()
        addObserver()

        // Do any additional setup after loading the view.
    }
    


    
    //MARK:- IBAction Part
    
    @IBAction func startButtonClicked(_ sender: Any) {
        
        guard let loginVC = self.storyboard?.instantiateViewController(identifier: "LoginViewController") as? LoginViewController else {return}
        
        
        self.present(loginVC, animated: true, completion: nil)
    }
    
    
    //MARK:- default Setting Function Part
    
    func hidelabel()
    {
        self.welcomeNameTextLabel.isHidden = true
        self.partNameTextLabel.isHidden = true
        self.partTitleTextLabel.isHidden = true
    }
    
    
    
    
    func addObserver()
    {
        NotificationCenter.default.addObserver(self, selector: #selector(getLoginData), name: NSNotification.Name("getLoginData"),     object: nil)
    }
    
    @objc func getLoginData(noti : NSNotification)
    {
        self.welcomeNameTextLabel.isHidden = false
        self.partNameTextLabel.isHidden = false
        self.partTitleTextLabel.isHidden = false
        
        let data = noti.object as? userLoginData ?? userLoginData()
        
        self.partNameTextLabel.text = data.part
        self.welcomeNameTextLabel.text = "\(data.name)님 환영합니다!"
    }
    

    //MARK:- Function Part
    

    

    //MARK:- extension 부분



}
