//
//  SigninViewController.swift
//  sixthWeek_Assignment
//
//  Created by 송지훈 on 2020/11/27.
//

import UIKit

class SigninViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var pwTextField: UITextField!
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func loginButtonClicked(_ sender: Any) {
        
        SigninService.shared.signin(email: self.emailTextField.text ?? "", pw: self.pwTextField.text ?? "" ) { (result) in
            
            switch(result)
            {
            case .success(_) :
                
                
                self.emailTextField.text = ""
                self.pwTextField.text = "" 
                makeAlert(title: "알림", message: "이주혁의 iOS 교실에 온것을 환영합니다~~", vc: self)
                
                
                
            case .networkFail :
                makeAlert(title: "오류", message: statusMessage.networkError, vc: self)
            
            case .requestErr(_) :
                makeAlert(title: "오류", message: "로그인에 실패하였습니다", vc: self)
            default :
                makeAlert(title: "오류", message: statusMessage.etcError, vc: self)
            }
        }
        
        
    }
    @IBAction func signupButtonClicked(_ sender: Any) {
        
        guard let signupVC = self.storyboard?.instantiateViewController(identifier: "SignupViewController") as? SignupViewController else {return }
        
        present(signupVC, animated: true, completion: nil)
        
        
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
