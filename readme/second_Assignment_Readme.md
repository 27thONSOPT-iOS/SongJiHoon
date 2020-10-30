# 2주차 과제



<img src="https://user-images.githubusercontent.com/60260284/96676679-dbeb5a80-13a8-11eb-8a69-082aa2913252.png" >




[파일로 이동하기](https://github.com/27thONSOPT-iOS/SongJiHoon/tree/master/%EA%B3%BC%EC%A0%9C/secondWeek_Assignment)

### 목표 : stackView를 활용해 뷰 구조를 잡고, scrollView를 이용하기

구현 결과물 <br>
![Oct-30-2020 14-47-54](https://user-images.githubusercontent.com/60260284/97665508-ebf8ed80-1abe-11eb-8d3e-e61df4e2e316.gif)



---

## 뷰 구조 잡기 


<img width="675" alt="스크린샷 2020-10-30 오후 2 49 27" src="https://user-images.githubusercontent.com/60260284/97665574-1ea2e600-1abf-11eb-9b51-df621c47bb3d.png">
위에 프로필 작성하기 버튼과 로고쪽을 넣기 위해 headerView를 사용했고,

밑에는 scrollView안에 mainContainerView를 채운 뒤에

넣고싶은 해당 사진과 텍스트뷰 및 라벨을 채워넣고 하나의 뷰로 감싼 뒤

Horizontal Stack를 4개 생성해 최종적으로 Vertical Stack으로 감싸는 식으로 뷰를 구성했습니다







---
## 업 버튼 만들기 

업 버튼은 메인 배너사진 밑으로 이동해야 보여지고, 다시 위로 올라갔을 때에는 보이지 않게 하여야 합니다

스크롤뷰를 활용해서 다음과 같은 동작을 구현하기 위해서는 <code> UIScrollViewDelegate</code>를 사용해야 합니다. <br>

<img width="680" alt="스크린샷 2020-10-30 오후 2 54 49" src="https://user-images.githubusercontent.com/60260284/97665897-de903300-1abf-11eb-96b4-7d906b36fe37.png">
<img width="680" alt="스크린샷 2020-10-30 오후 2 55 01" src="https://user-images.githubusercontent.com/60260284/97665907-e4861400-1abf-11eb-8e82-d0124730faa5.png">

<br> 해당 사진은 UIScrollViewDelegate 프로토콜에 해당하는 함수라
원하는 뷰컨에 <code> UIScrollViewDelegate</code>를 채택하고 필요한 함수를 꺼내쓰면 됩니다!
<br>
<code> UIScrollViewDelegate</code>에 대해 자세히 알아보고 싶다면<br>
[여기를 참고해주세요!!](https://yagom.net/forums/topic/uitableview%EC%97%90%EC%84%9C-%EC%A3%BC%EB%A1%9C-%EC%82%AC%EC%9A%A9%EB%90%98%EB%8A%94-uiscrollviewdelegate%EB%A5%BC-%EC%95%8C%EC%95%84%EB%B3%B4%EC%9E%90/)

우리는 이 중에서
<code> scrollViewDidScroll</code> 를 활용해서 스크롤이 되었을 때 -> 어느 위치에 스크롤뷰가 이동했는지 파악을 하려고 합니다!


<img width="566" alt="스크린샷 2020-10-30 오후 2 58 29" src="https://user-images.githubusercontent.com/60260284/97666141-6118f280-1ac0-11eb-86c3-fd0964a0d341.png">

여기서 말하는 ContentOffset은 point입니다. 즉, x, y좌표를 의미하는것으로써 스크롤을 한다는 것 자체가 contentOffset이 변한다는 의미입니다.
<br>
따라서, <code> scrollView.contentOffset.y </code> 부분은 현재 스크롤뷰의 y좌표를 의미하게 됩니다
이 y좌표 값을 <code>yPostion</code> 변수에 저장을 해두고
<img width="439" alt="스크린샷 2020-10-30 오후 3 00 36" src="https://user-images.githubusercontent.com/60260284/97666299-accb9c00-1ac0-11eb-8ab4-f8509038e057.png">

메인 배너의 height 보다 더 넘어가게 되면 
<code> upButton.isHidden = false </code>
버튼을 보여주는 방식을 활용합니다.

다시 <code>yPostion</code>이 배너보다 작은 경우에는 업 버튼을 사라지게 해야 합니다!!

업버튼을 보여주고, 사라지는 걸 구현했다면
해당 버튼을 눌렀을 때 맨 위로 가는 걸 구현해야 하는데
여러가지 방법이 있겠지만, 



<img width="607" alt="스크린샷 2020-10-30 오후 3 10 42" src="https://user-images.githubusercontent.com/60260284/97666941-14ceb200-1ac2-11eb-975f-510175ab948a.png">

scrollView를 확장시켜 가장 위로 가는 함수를 만들어줍니다
여기서 사용되는 <code>contentInset</code>는 padding같은 개념인데, 패딩이 있는 경우에 패딩 값 만큼 고려를 해서 스크롤을 해야 합니다. 

해당 좌표를 스크롤 뷰에 대해 setContentOffset(좌표계 설정)을 하고 애니메이션을 걸어주는 함수를 만들면
가장 위로 촤르륵 이동하게 됩니다 ^~^

