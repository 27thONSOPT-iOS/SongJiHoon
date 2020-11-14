//
//  ViewController.swift
//  thirdWeek_Assignment
//
//  Created by 송지훈 on 2020/11/01.
//

import UIKit

class ViewController: UIViewController,UIScrollViewDelegate{

    
    
    
    
    //MARK:- IBOutlet Part
    
    @IBOutlet weak var userCollectionView: UICollectionView!
    @IBOutlet weak var mainScrollView: UIScrollView!
    
    //MARK:- Variable Part
    
    var userDataList : [userData] = []
    
    //MARK:- Constraint Part
    
    @IBOutlet weak var headerViewTopConstraint: NSLayoutConstraint!
    // -88 ~ 0
    

    //MARK:- Life Cycle Part
    override func viewDidLoad() {
        
        super.viewDidLoad()
        settingCollectionView()
        settingData()
    }
    
    

    //MARK:- default Setting Function Part
    
    func settingCollectionView()
    {
        self.mainScrollView.delegate = self
        self.userCollectionView.delegate = self
        self.userCollectionView.dataSource = self
    }
    
    func settingData()
    {
        self.userDataList.append(contentsOf: [
        
            userData(name: "이주혁", imageName: "juhyeok", description: "#hereis#아요#내꿈은#사과농장#ENFP"),
            userData(name: "김나연", imageName: "nayeon", description: "#이제막학기 #여러분들이랑_친해지고_싶어요#번개스터디환영"),
            userData(name: "손평화", imageName: "peace", description: "#핸드피쓰 #이너피쓰 #배꼽도둑#헬린이 #sson_peace7"),
            userData(name: "유희수", imageName: "heesoo", description: "#총무꿈나무 #유총무 #현재_소식중 #풉"),
            userData(name: "박세은", imageName: "saeeun", description: "#마 #아요는 #처음입니다"),
            userData(name: "한울", imageName: "wool", description: "#ENFP #STORM #울크박스 #@hwooolll #하늘콜렉터"),
            userData(name: "김한솔", imageName: "hansol", description: "#고객중심#고객행동데이터기반한#UX디자이너#워너비,,"),
            userData(name: "배민주", imageName: "minju", description: "#디팟장 #개자이너 #최종목표는행복"),
            userData(name: "최영훈", imageName: "younghun", description: "#서팟짱 #솝트3회차 #앱잼_요리_개발자 #UX/UI"),
            userData(name: "강민구", imageName: "minguru", description: "#밍맹 #안팟장 #이래뵈도_귀여운거좋아함 #지박령 #허당"),
            userData(name: "이정연", imageName: "yeonjeong", description: "#플레이스픽 #ENFJ #기획_디자인_개발_다"),
            userData(name: "홍준엽", imageName: "junyeop", description: "#26기서버 #27기웹 #샵이_두개면_어떻게될까? ##")
        
        ])
        
        
    }
    
    //MARK:- Function Part
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        print("멈춤")
        UIView.animate(withDuration: 0.3) {
            self.headerViewTopConstraint.constant = 0
            self.view.layoutIfNeeded()
            
        }
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        print("begin")
        UIView.animate(withDuration: 0.3) {
            self.headerViewTopConstraint.constant = -88
            self.view.layoutIfNeeded()
        }
    }


}

//MARK:- extension Part

extension ViewController : UICollectionViewDelegate
{
}

extension ViewController : UICollectionViewDataSource
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return userDataList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        guard let userCell = collectionView.dequeueReusableCell(withReuseIdentifier: "userCell", for: indexPath) as? userCollectionCell else {return UICollectionViewCell() }
        
        
        userCell.settingData(name: userDataList[indexPath.row].name, imageName: userDataList[indexPath.row].imageName, description:userDataList[indexPath.row].description )
        
        return userCell
    }
    
}

extension ViewController : UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = (self.userCollectionView.frame.width - 27) / 2
        let height =  width * 1.5
        
        return CGSize(width: width, height: height)
        
        
        
    }
    

    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:
    UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
        
    }
    
    



    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:
    UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
    return 0
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:
    UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
    return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    
}
