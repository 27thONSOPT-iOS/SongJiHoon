//
//  SignupViewController.swift
//  sixthWeek_Assignment
//
//  Created by 송지훈 on 2020/11/27.
//

import UIKit

class SignupViewController: UIViewController {
    
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var userNameTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func signupButtonClicked(_ sender: Any) {
        
        
        SignupService.shared.signup(email: self.emailTextField.text ?? "", pw: self.passwordTextField.text ?? "", userName: userNameTextField.text ?? "") { (result) in
            
            switch(result)
            {
            case .success(_) :
                
                
                self.emailTextField.text = ""
                self.passwordTextField.text = ""
                self.userNameTextField.text = ""
                
                let alert = UIAlertController(title: "알림", message: "회원가입이 완료되었습니아~~", preferredStyle: .alert)
                let ok = UIAlertAction(title: "확인", style: .default) { (_) in
                    self.dismiss(animated: true, completion: nil)
                }
                alert.addAction(ok)
                self.present(alert, animated: true, completion: nil)
                
                
                
                
            case .networkFail :
                makeAlert(title: "오류", message: statusMessage.networkError, vc: self)
            
            case .requestErr(_) :
                makeAlert(title: "오류", message: "회원가입에 실패하였습니다", vc: self)
            default :
                makeAlert(title: "오류", message: statusMessage.etcError, vc: self)
            }
        }
        
        
    }
    
}
