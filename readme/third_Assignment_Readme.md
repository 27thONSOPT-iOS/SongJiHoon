# 3주차 과제


![3주차 과제 대문](https://user-images.githubusercontent.com/60260284/97891450-2342f500-1d72-11eb-9e2c-abd01142d6d3.png)



[파일로 이동하기](https://github.com/27thONSOPT-iOS/SongJiHoon/tree/master/%EA%B3%BC%EC%A0%9C/thirdWeek_Assignment)

### 목표 : CollectionView를 활용해 레이아웃 구성해서 스크롤 하기

구현 결과물 <br>
![collectionView](https://user-images.githubusercontent.com/60260284/97891417-19b98d00-1d72-11eb-95a8-1a7a0932210e.gif)




---

2주차와 비슷한 과제지만, 
2주차에서는 Stack을 이용해 뷰를 작성했다면은
이번에는 CollectionView를 활용해 뷰를 작성해보았습니다!

## 뷰 구조 잡기 


<img width="597" alt="스크린샷 2020-11-03 오전 1 31 38" src="https://user-images.githubusercontent.com/60260284/97893213-54bcc000-1d74-11eb-9aa6-c33a14aa8c90.png">
이전 2주차와 동일하게,
위에 프로필 작성하기 버튼과 로고쪽을 넣기 위해 headerView를 사용했고,

밑에는 scrollView안에 mainContainerView를 채운 뒤에

넣고싶은 배너 이미지를 넣어주고

2주차와 달라진 점은 "CollectionView"를 넣어주는 것입니다!!

현재 모든 컬렉션 셀이 동일한 구성으로 되어 있기에
CollectionView에 하나의 셀만 올려서 작성을 해보도록 하겠습니다!!


## CollectionView 설정

<img width="369" alt="스크린샷 2020-11-03 오전 1 35 17" src="https://user-images.githubusercontent.com/60260284/97893607-d7457f80-1d74-11eb-82d0-3dc526df3425.png">
다음과 같이 컬렉션 뷰에 대해 delegate와 dataSource에 대해 설정을 해줍니다!

3주차 세미나에서 배운대로 차근차근 따라하면 뷰를 구성하는데는 문제가 없지만!

<code> UICollectionViewDelegateFlowLayout </code>를 활용해 셀들의 크기 및 마진을 잡아보도록 합니다!!


<img width="1084" alt="스크린샷 2020-11-03 오전 1 38 15" src="https://user-images.githubusercontent.com/60260284/97893941-402cf780-1d75-11eb-9f02-8b3db4a91f23.png">
<img width="1092" alt="스크린샷 2020-11-03 오전 1 39 20" src="https://user-images.githubusercontent.com/60260284/97894064-66eb2e00-1d75-11eb-86d9-16d4c324c6fa.png">



<img width="1081" alt="스크린샷 2020-11-03 오전 1 38 03" src="https://user-images.githubusercontent.com/60260284/97893915-386d5300-1d75-11eb-90bd-a5387eedb5c7.png">

<img width="1148" alt="스크린샷 2020-11-03 오전 10 22 34" src="https://user-images.githubusercontent.com/60260284/97936310-7e9ad480-1dbe-11eb-893a-4d7ac8606131.png">



다음과 같은 메소드를 활용해 Cell 의 크기 및 위치 / 마진을 잡아두면 됩니다!!

다 맞게 세팅후, 실행했을 때, 올바르게 출력 되지 않는다면

스토리보드 UICollectionView 인스펙터에서 <br>
<img width="252" alt="스크린샷 2020-11-03 오전 1 40 54" src="https://user-images.githubusercontent.com/60260284/97894230-9ef27100-1d75-11eb-8a45-956b827c445e.png"> <br>
"estimate Size"에 대해서 none을 처리해주면 쉽게 레이아웃이 원하는대로 구성된 것을 볼 수 있습니다!


<br><br>

## 스크롤 설정


ScrollVIew 같은 경우에는 내부 container 뷰에 있는 요소들의 높이가 정확히 결정 되어 있어야 합니다. 
따라서 스크롤 뷰 안에 배너 이미지를 넣고, 컬렉션 뷰를 넣고 짤 때, 높이를 결정해야 전체가 스크롤이 가능합니다!!

#### 컬렉션뷰의 높이를 결정하지 않는다면?

컬렉션뷰의 높이가 결정되지 않아 상위에 있는 스크롤뷰는 컬렉션뷰의 높이를 모르기때문에 전체 스크롤이 되지 않고
내부에 있는 컬렉션뷰에서만 스크롤이 가능해집니다,,


#### 컬렉션뷰하고 스크롤뷰의 스크롤이 따로 놀고 있다면??

컬렉션뷰에도 스크롤이 먹고, 상위 스크롤뷰에도 스크롤이 먹는다면
미묘하게 스크롤 액션이 이상한 것을 볼 수 있습니다!

이렇게 되었을 경우에는,
내부 컬렉션 뷰에 대해 height 를 걸고, User Interaction, 즉 컬렉션 뷰에 대해 스크롤을 안먹게 한 뒤에

<img width="241" alt="스크린샷 2020-11-03 오전 10 27 20" src="https://user-images.githubusercontent.com/60260284/97936532-2912f780-1dbf-11eb-9e79-f35f0ff7c2aa.png">


컬렉션 뷰에 대해 높이를 낭낭하게... 적당하게.. 높게 설정해주면 스크롤이 깔끔하게 되는 것을 볼 수 있습니다!!



(전체 코드)<br>
```Swift
//
//  ViewController.swift
//  thirdWeek_Assignment
//
//  Created by 송지훈 on 2020/11/01.
//

import UIKit

class ViewController: UIViewController {

    
    var userDataList : [userData] = []
    @IBOutlet weak var userCollectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        settingCollectionView()
        settingData()
        
    }
    
    func settingCollectionView()
    {
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


}

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

```
