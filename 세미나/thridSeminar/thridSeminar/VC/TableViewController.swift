//
//  TableViewController.swift
//  thridSeminar
//
//  Created by 송지훈 on 2020/10/31.
//

import UIKit

class TableViewController: UIViewController {

    
    var musicList : [MusicData] = []
    @IBOutlet weak var musicTableView: UITableView!
    let tableCellIdentifer = "MusicTableCell"
    override func viewDidLoad() {
        
        super.viewDidLoad()
        self.navigationController?.navigationBar.isHidden = true
        settingTableView()
        settingMusicData()

       
    }
    
    func settingTableView()
    {
        self.musicTableView.delegate = self
        self.musicTableView.dataSource = self
    }
    
    func settingMusicData()
    {
        
        self.musicList.append(contentsOf: [
        
            MusicData(title: "Lovesick Girls", singer: "BLACK PINK", imageName: "blackpink"),
            MusicData(title: "Dynamite", singer: "방탄소년단", imageName: "bts"),
            MusicData(title: "positions", singer: "Ariana Grande", imageName: "ariana"),
            MusicData(title: "놓아줘 (with 태연)", singer: "크러쉬", imageName: "crush"),
            MusicData(title: "I CAN'T STOP ME", singer: "TWICE", imageName: "twice"),
            MusicData(title: "Make A Wish (Birthday Song)", singer: "NCT U", imageName: "nctu"),
            MusicData(title: "ALIEN", singer: "이수현", imageName: "leesuhyeon"),
            MusicData(title: "DON'T TOUCH ME", singer: "환불원정대", imageName: "hwanbool"),
            MusicData(title: "Pretty Savage", singer: "BLACKPINK", imageName: "blackpink"),
            MusicData(title: "Bet You Wanna (feat. Cardi B)", singer: "BLACKPINK", imageName: "blackpink")
        
        
        
        ])

    }
    


}

extension TableViewController : UITableViewDataSource
{
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return musicList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let musicCell = tableView.dequeueReusableCell(withIdentifier: self.tableCellIdentifer, for: indexPath) as? MusicTableCell
        else {return UITableViewCell()}
        
        musicCell.settingData(index: indexPath.row + 1, imageName: musicList[indexPath.row].imageName, title: musicList[indexPath.row].title, singer: musicList[indexPath.row].singer)
        
        return musicCell

    }
    
    
    
}
extension TableViewController : UITableViewDelegate
{
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
        guard let nextVC = storyboard?.instantiateViewController(withIdentifier: "MusicDetailViewController") as? MusicDetailViewController
        else {return }
        
        nextVC.musicData = musicList[indexPath.row]
        
        self.navigationController?.pushViewController(nextVC, animated: true)
        
        
    }
}
