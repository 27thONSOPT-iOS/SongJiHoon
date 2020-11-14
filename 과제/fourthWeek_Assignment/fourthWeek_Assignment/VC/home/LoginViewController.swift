//
//  LoginViewController.swift
//  fourthWeek_Assignment
//
//  Created by 송지훈 on 2020/11/14.
//

import UIKit

class LoginViewController: UIViewController {
    
    //MARK:- IBOutlet Part
    
    @IBOutlet weak var loginMainBannerImageView: UIImageView!
    @IBOutlet weak var partNameTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    
    //MARK:- Variable Part

   //MARK:- Constraint Part
    
    @IBOutlet weak var loginAreaTopConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var imageViewHeightConstraint: NSLayoutConstraint!
    //MARK:- Life Cycle Part
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addKeyBoardAccessaryView()

        let tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyBoard))
        
        view.addGestureRecognizer(tap)
    }
    

    override func viewWillAppear(_ animated: Bool) {
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name:UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name:UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    //MARK:- IBAction Part
    
    @IBAction func loginButtonClicked(_ sender: Any) {
        
        if self.nameTextField.text != "" && partNameTextField.text != ""
        {
            let userData = userLoginData(name: self.nameTextField.text ?? "" , part: self.partNameTextField.text ?? "")
            
            NotificationCenter.default.post(name: NSNotification.Name("getLoginData"),object: userData)
            
            
            
            dismiss(animated: true) {
                self.nameTextField.text = ""
                self.partNameTextField.text = ""
            }
        }
        else
        {
            let alertController = UIAlertController(title: "알림", message: "필요한 정보를 입력해주세요", preferredStyle: .alert)
            let okAction = UIAlertAction(title: "확인", style: .default, handler: nil)
            
            alertController.addAction(okAction)
            self.present(alertController, animated: true, completion: nil)
        }
        

    }
    
    
    
    //MARK:- default Setting Function Part
    


    //MARK:- Function Part
    func addKeyBoardAccessaryView()
    {
        let toolBarKeyboard = UIToolbar()
        toolBarKeyboard.sizeToFit()
        let flexSpace = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        let btnDoneBar = UIBarButtonItem(title: "닫기", style: .done, target: self, action: #selector(dismissKeyBoard))
        toolBarKeyboard.items = [flexSpace,btnDoneBar]
        toolBarKeyboard.tintColor = .black
        
        partNameTextField.inputAccessoryView = toolBarKeyboard
        nameTextField.inputAccessoryView = toolBarKeyboard
    }

    
    //MARK:- keyboard Action 부분
    

    @objc func keyboardWillShow(notification : Notification){



        UIView.animate(withDuration: 0.5) {
            self.imageViewHeightConstraint.constant = 100
            self.loginMainBannerImageView.alpha = 0
            self.loginAreaTopConstraint.constant = 0
            self.view.layoutIfNeeded()
        }
    }
    
    
    @objc func keyboardWillHide(notification: Notification){
        
        
        UIView.animate(withDuration: 0.5) {
            self.imageViewHeightConstraint.constant = 200
            
            self.loginMainBannerImageView.alpha = 1
            self.loginAreaTopConstraint.constant = 200
            self.view.layoutIfNeeded()

        }

        
    }
    
    
    
    @objc func dismissKeyBoard(){
        self.view.endEditing(true)
    }

    //MARK:- extension 부분



    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
