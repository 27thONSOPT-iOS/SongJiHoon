//
//  SenderViewController.swift
//  firstSeminar
//
//  Created by 송지훈 on 2020/10/10.
//

import UIKit

class SenderViewController: UIViewController {

    
    var onOffValue : Bool = false
    var countData : Int = 0
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var OnOffSwitch: UISwitch!
    @IBOutlet weak var stepper: UIStepper!
    
    
    @IBOutlet weak var switchResultLabel: UILabel!
    
    @IBOutlet weak var stepperCountLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    
    @IBAction func isOnOffSwitchClicked(_ sender: UISwitch) {
        
        self.onOffValue = sender.isOn
        
        if onOffValue == true
        {
            self.switchResultLabel.text = "true"
        }
        else
        
        {
            self.switchResultLabel.text = "false"
        }
        
        
    }
    

    @IBAction func senderButtonClicked(_ sender: UIStepper) {
        
        
        self.countData = Int(sender.value)
        self.stepperCountLabel.text = "\(countData)"
    }
    
    
    
    @IBAction func nextButtonClicked(_ sender: Any) {
        
        
        guard let nextVC = self.storyboard?.instantiateViewController(identifier: "ReceiverViewController") as? ReceiverViewController else {return}
        
        nextVC.count = self.countData
        nextVC.email = self.emailTextField.text ?? ""
        nextVC.isOnOff = self.switchResultLabel.text ?? ""
        
        
        nextVC.modalPresentationStyle = .fullScreen
        
        self.present(nextVC, animated: true, completion: nil)
    }
    
    
    
    
    


}
