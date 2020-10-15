//
//  ViewController.swift
//  firstSeminar
//
//  Created by 송지훈 on 2020/10/10.
//

import UIKit
import Foundation

class ViewController: UIViewController {

 
    
    @IBOutlet weak var textLabel: UILabel!
    
    @IBAction func changeButtonClicked(_ sender: Any) {
        
        
        
        
        textLabel.text = "HELLO ON SOPT!"
        textLabel.textColor = .blue
        textLabel.sizeToFit()
        // helloLabel에 대해 사이즈 재조정
        // 기본으로 들어가는건지 코드로 해줘야하는건지 다시 파악해봐야 한당...
        
        
        
        
        
    }
    
    @IBAction func nextButtonClicked(_ sender: Any) {
        
        
        guard let nextVC = self.storyboard?.instantiateViewController(identifier: "secondVC") as? SecondViewController else {return}
        
        nextVC.modalPresentationStyle = .automatic
        

        nextVC.modalTransitionStyle = .coverVertical
        //ModalTransitionStyle
        /*
         
         
         1. coverVertical (default)
          아래에서 위로 새로운 뷰가 깔린다
         
         
         2. crossDissolve
         사르륵 사라지는 효과가 발생한다
         
         
         3. flipHorizontal :
         카드 뒤집듯이 이동함
         
         
         4. particalCurl :
         페이지를 넘기듯이 이동함
         (!! modalPresentationStyle이 fullScreen 일때만 사용가능, 아닌 경우에 runtime 에러 발생)
         
         */





        self.present(nextVC, animated: true, completion: nil)
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        self.navigationController?.navigationBar.isHidden = true
    }


}

