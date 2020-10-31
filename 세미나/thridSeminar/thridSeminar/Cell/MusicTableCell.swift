//
//  MusicTableCell.swift
//  thridSeminar
//
//  Created by 송지훈 on 2020/10/31.
//

import UIKit

class MusicTableCell: UITableViewCell {
    
    
    @IBOutlet weak var singerImageView: UIImageView!
    @IBOutlet weak var rankTextLabel: UILabel!
    
    @IBOutlet weak var titleTextLabel: UILabel!
    @IBOutlet weak var singerLabel: UILabel!
    
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func settingData(index : Int, imageName : String, title : String, singer : String)
    {
        self.rankTextLabel.text = String(index)
        self.singerImageView.image = UIImage(named: imageName)
        self.titleTextLabel.text = title
        self.singerLabel.text = singer
    }

}
