//
//  bannerCollectionViewController.swift
//  thridSeminar
//
//  Created by 송지훈 on 2020/10/31.
//

import UIKit

class bannerCollectionViewController: UIViewController {

    
    var bannerList : [bannerData] = []
    @IBOutlet weak var pageController: UIPageControl!
    @IBOutlet weak var bannerCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bannerCollectionView.delegate = self
        bannerCollectionView.dataSource = self
        settingBanner()
        pageController.numberOfPages = bannerList.count
        pageController.currentPage = 0
        bannerCollectionView.isPagingEnabled = true
        

        // Do any additional setup after loading the view.
    }
    
    func settingBanner()
    {
        self.bannerList.append(contentsOf: [
        
            bannerData(imageName: "plan"),
            bannerData(imageName: "design"),
            bannerData(imageName: "server"),
            bannerData(imageName: "ios"),
            bannerData(imageName: "android"),
            bannerData(imageName: "web")
        
        ])
    }



}

extension bannerCollectionViewController : UICollectionViewDelegate
{
    
    
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        pageController.currentPage = Int (scrollView.contentOffset.x) / Int (scrollView.frame.width)
    }
}

extension bannerCollectionViewController: UICollectionViewDataSource
{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return bannerList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let bannerCell = collectionView.dequeueReusableCell(withReuseIdentifier: "bannerCell", for: indexPath) as? bannerCollectionViewCell else {return UICollectionViewCell()}
        
        bannerCell.setImage(imageName: bannerList[indexPath.row].imageName)
        
        return bannerCell
        
    }
    
    
}
extension bannerCollectionViewController:UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout:
    UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: collectionView.frame.width,
                  height: collectionView.frame.height)
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
