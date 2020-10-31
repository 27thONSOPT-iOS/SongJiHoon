//
//  MusicDetailViewController.swift
//  thridSeminar
//
//  Created by 송지훈 on 2020/10/31.
//

import UIKit

class MusicDetailViewController: UIViewController {

    @IBOutlet weak var musicImageView: UIImageView!
    
    @IBOutlet weak var titleTextLabel: UILabel!
    
    @IBOutlet weak var singerTextLabel: UILabel!
    var musicData : MusicData?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        self.musicImageView.image = UIImage(named: musicData?.imageName ?? "")
        
        self.titleTextLabel.text = musicData?.title
        self.singerTextLabel.text = musicData?.singer
        
        
        self.titleTextLabel.sizeToFit()
        self.singerTextLabel.sizeToFit()

        // Do any additional setup after loading the view.
    }
    

    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
    }
    
    

}
