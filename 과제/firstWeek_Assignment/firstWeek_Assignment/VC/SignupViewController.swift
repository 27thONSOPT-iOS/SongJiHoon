//
//  SignupViewController.swift
//  firstWeek_Assignment
//
//  Created by 송지훈 on 2020/10/15.
//

import UIKit

class SignupViewController: UIViewController {
    
    
    
    @IBOutlet weak var partTextField: UITextField!
    
    @IBOutlet weak var birthYearTextField: UITextField!
    
    @IBOutlet weak var nameTextField: UITextField!
    

    override func viewDidLoad() {
        
        super.viewDidLoad()
        settingNavi()
        


    }
    
    func settingNavi()
    {
        self.navigationController?.navigationBar.topItem!.title = "회원 가입"
    }
    
    
    @IBAction func signupButtonClicked(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
        
    }
    



}
