//
//  SecondViewController.swift
//  firstSeminar
//
//  Created by 송지훈 on 2020/10/10.
//

import UIKit

class SecondViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func closeButtonClicked(_ sender: Any) {
        
        if self.navigationController != nil // 네비게이션으로 이동했다면 pop 을 해야하고,
        {
            self.navigationController?.popViewController(animated: true)
        }
        else                                // modal 로 전환됐을 경우에는 dismiss 를 해야 한다 !! 
        {
            self.dismiss(animated: true, completion: nil)
        }
        
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
