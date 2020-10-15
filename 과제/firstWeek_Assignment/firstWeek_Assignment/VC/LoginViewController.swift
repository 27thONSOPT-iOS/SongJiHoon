//
//  LoginViewController.swift
//  firstWeek_Assignment
//
//  Created by 송지훈 on 2020/10/15.
//

import UIKit

class LoginViewController: UIViewController {

    
    @IBOutlet weak var partTextField: UITextField!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    
    var personalInfo : [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func loginButtonClicked(_ sender: Any) {
        
        
        
        self.personalInfo.append(partTextField.text ?? "")
        self.personalInfo.append(nameTextField.text ?? "")
        
        
        NotificationCenter.default.post(name: NSNotification.Name("dataReceived"), object: self.personalInfo)
        
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func signupButtonClicked(_ sender: Any) {
        
        guard let signupVC = self.storyboard?.instantiateViewController(identifier: "SignupViewController" ) as? SignupViewController else {return}
        
        
        
        self.navigationController?.pushViewController(signupVC, animated: true)
    }
    

}
