//
//  ViewController.swift
//  secondWeek_Assignment
//
//  Created by 송지훈 on 2020/10/21.
//

import UIKit



extension UIScrollView {
    func scrollToTop() {
        
        let desiredOffset = CGPoint(x: 0, y: -contentInset.top)
        setContentOffset(desiredOffset, animated: true)
   }
}
class ViewController: UIViewController ,UIScrollViewDelegate{

    @IBOutlet weak var mainScrollView: UIScrollView!
    @IBOutlet weak var upButton: UIButton!
    @IBOutlet weak var bannerImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        upButton.isHidden = true
        self.mainScrollView.delegate = self
    }
    
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let yPosition = scrollView.contentOffset.y
        
    
        if yPosition > self.bannerImageView.bounds.height
        {
            upButton.isHidden = false
        }
        else
        {
            
            upButton.isHidden = true
        }
    }
    

    @IBAction func upButtonClicked(_ sender: Any) {
        
        mainScrollView.scrollToTop()
    }
    
}

