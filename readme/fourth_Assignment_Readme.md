# 4주차 과제






[파일로 이동하기](https://github.com/27thONSOPT-iOS/SongJiHoon/tree/master/%EA%B3%BC%EC%A0%9C/fourthWeek_Assignment)

### 목표 : 탭바 활용해서 로그인 창 + 3주차 세미나 파일 연결하기

구현 결과물 <br>

1. 로그인 탭 <br>

![로그인](https://user-images.githubusercontent.com/60260284/99137354-9fd8ac00-266d-11eb-8514-d1b578bccd85.gif)
2. 컬렉션 탭<br>
![컬렉션뷰](https://user-images.githubusercontent.com/60260284/99137356-a109d900-266d-11eb-96cd-5f4043c54f8a.gif)

---

이번 과제는 1주차 3주차 과제를 기반으로 탭바를 만들어서 구성하는 과제였습니다


## 키보드 액션 만들어주기

기존 1주차 과제와 다른 점은 동일하지만,
키보드가 올라왔을 때 처리를 해주는 것이 추가가 되었습니다!

키보드가 올라왔을 때, 내려갔을 때 이벤트를 처리하는 것은 NotificationCenter를 활용하는 방법이 있는데요!

저는 ViewWIllAppear에 해당 observer를 달아서 처리를 해두었습니다

```Swift

    override func viewWillAppear(_ animated: Bool) {
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow(notification:)), name:UIResponder.keyboardWillShowNotification, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide(notification:)), name:UIResponder.keyboardWillHideNotification, object: nil)
    }

```

그리고 해당 함수들은

```
    

    @objc func keyboardWillShow(notification : Notification){



        UIView.animate(withDuration: 0.5) {
            self.imageViewHeightConstraint.constant = 100
            self.loginMainBannerImageView.alpha = 0
            self.loginAreaTopConstraint.constant = 0
            self.view.layoutIfNeeded()
        }
    }
    
    
    @objc func keyboardWillHide(notification: Notification){
        
        
        UIView.animate(withDuration: 0.5) {
            self.imageViewHeightConstraint.constant = 200
            
            self.loginMainBannerImageView.alpha = 1
            self.loginAreaTopConstraint.constant = 200
            self.view.layoutIfNeeded()

        }

        
    }
    
    
    
    @objc func dismissKeyBoard(){
        self.view.endEditing(true)
    }

```
따로 처리를 해두었습니다

또한 키보드가 아닌 다른 구역을 tap 했을때도 키보드가 내려 갈 수 있도록

```Swift
    override func viewDidLoad() {
        super.viewDidLoad()
        addKeyBoardAccessaryView()

        let tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyBoard))
        
        view.addGestureRecognizer(tap)
    }
    

```

UITapGesture를 view에다가 달아주었습니다!!

## ScrollView 액션 달아주기

과제 중 하나가 스크롤이 시작/종료되는 시점을 찾아서 거기에 대해 애니메이션을 걸어주는게 있었는데요!

저는 .. 시점을 <br>
UIScrollViewDelegate를 활용해서 <br>
<br>
scrollViewWillBeginDragging<br>
을 이용해서 시작지점을 찾고,<br>
<br>
scrollViewDidEndDecelerating<br>
을 이용해서 스크롤 종료 시점을 찾아서<br>
<br>
해당 애니메이션을 걸어주었습니다!<br>





![스크린샷 2020-11-14 오후 12 24 59](https://user-images.githubusercontent.com/60260284/99138508-6ce5e680-2674-11eb-9bac-4ff3462770ff.png)





