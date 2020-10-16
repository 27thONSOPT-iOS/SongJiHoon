# 1주차 세미나





<img width="887" alt="스크린샷 2020-10-16 오후 9 02 59" src="https://user-images.githubusercontent.com/60260284/96256092-fa410700-0ff2-11eb-9cd9-d064aeaefba3.png">


### 뷰 사이에 데이터 전달하기

앱을 설계 할때에는 보통 여러가지 뷰를 통해 데이터를 전달하고,
해당 뷰에서는 받은 데이터를 통해 뷰를 그리고 동작을 수행하게 됩니다.

이번 세미나에서는 간단한 뷰 전환을 배우고 - 뷰 간 데이터 전달을 다뤘는데
세미나에서 배운 방법을 포함에서 다른 방법까지 같이 다뤄보려고 합니다!!

먼저 데이터를 전달하는 방법은 6가지가 있습니다 !!(KVO 방식은 object-C 에서 사용하는 방식이라 따로 기술하지는 않았습니다)

**1. 프로퍼티를 이용해서 서로 data 주고받기(A->B)**

**2. 세그를 이용해서 서로 data 주고받기(스토리보드에서)**

**3. 프로퍼티와 함수를 이용해서 data 받기(A<-B)**

**4. delegation 이용해서 data 받기**

**5. closure 이용해서 data 받기**

**6. NotificationCenter와 Observer pattern을 이용해서 서로 data 주고받기**

---


### 1. 프로퍼티에 직접 접근해 data 전달하기



<img width="1045" alt="스크린샷 2020-10-16 오후 9 20 04" src="https://user-images.githubusercontent.com/60260284/96257465-5e64ca80-0ff5-11eb-847e-835d751c7f5d.png">

- 프로퍼티란 무엇일까?!
프로퍼티는 클래스에 속해 있는 변수.
즉, 클래스의 모든 인스턴스는 프로퍼티를 갖게 될 것이고,직접 여기에 값을 할당 할 수 있습니다!

<img width="417" alt="스크린샷 2020-10-16 오후 9 22 02" src="https://user-images.githubusercontent.com/60260284/96257621-a2f06600-0ff5-11eb-8be6-b924fadf9096.png">

현재 SecondViewController를 선언하고 해당 뷰컨트롤러에 text 라는 프로퍼티를 생성해뒀습니다. 이렇게 변수를 만들어 놓으면은

첫번째 뷰 컨트롤러에서 


```Swift
    guard let vc =  storyboard?.instantiateViewController(identifier: "secondViewController") as? SecondViewController else
        { return } 
```
현재 같은 스토리보드에서 secondViewController 라는 identifier를 가지고 있는 뷰컨을 vc 이라고 선언하게 되면은

<img width="1014" alt="스크린샷 2020-10-16 오후 9 23 04" src="https://user-images.githubusercontent.com/60260284/96257697-c87d6f80-0ff5-11eb-989a-642b2923b177.png">

다음과 같이 vc 뷰컨에 있는 text 라는 변수/프로퍼티에 접근이 가능해집니다.

<img width="597" alt="스크린샷 2020-10-16 오후 9 28 19" src="https://user-images.githubusercontent.com/60260284/96258128-84d73580-0ff6-11eb-8663-c71342bc7de1.png">

접근 가능한 text 라는 프로퍼티에 현재 있는 뷰컨의 데이터를 대입하고,
navigation 으로 push 를 하는 경우에 데이터가 전달이 됩니다!!

위 주석과 같이, vc.text에 데이터를 할당했다고 뷰컨 자체의 데이터가 할당되는 것이 아니라,
navigation stack에 쌓이게 될 뷰컨에 다음과 같은 프로퍼티를 같이 넘긴다는 의미이기 때문에
꼭 push 나 present 를 하는 경우에만 데이터가 전달이 됩니다!!



( 첫번째 뷰컨에서 넘기는 부분 )

<img width="683" alt="스크린샷 2020-10-16 오후 9 30 42" src="https://user-images.githubusercontent.com/60260284/96258347-da134700-0ff6-11eb-85b0-db51555f7a67.png">


(두번째 뷰컨에서 받는 부분)

<img width="469" alt="스크린샷 2020-10-16 오후 9 32 46" src="https://user-images.githubusercontent.com/60260284/96258553-23fc2d00-0ff7-11eb-9cc7-9227e8d07acd.png">

다음과 같이 push를 했을 경우에 정상적으로 데이터가 전달이 되는 것을 볼 수 있습니다

![프로퍼티 접근](https://user-images.githubusercontent.com/60260284/96259126-172c0900-0ff8-11eb-8cc0-8680ac9230b0.gif)



---
### 2. 세그를 이용해 데이터 전달하기

세그를 설명하기 이전에,,, 스토리보드에 대해 간단히 설명하겠습니다!!

<img width="408" alt="스크린샷 2020-10-16 오후 9 40 48" src="https://user-images.githubusercontent.com/60260284/96259221-43e02080-0ff8-11eb-9158-81ee71f948d5.png">

이전 Xcode 에서 스토리보드를 사용하기 이전에, 인터페이스 빌더를 이용해 UI를 구성했습니다. 인터페이스 빌더에서도 화면 내 들어갈 UI 요소와 크기 및 속성등을 정의하게 되는데 이러한 내용들은 "XML" 포맷으로 저장합니다!

XML 포맷으로 저장되는 Interface Builder 파일을 줄여서 .xib 파일 이라고 부르게 됩니다!!

<img width="100" alt="스크린샷 2020-10-16 오후 9 42 37" src="https://user-images.githubusercontent.com/60260284/96259405-843f9e80-0ff8-11eb-8adb-13f276ffe841.png">

Xcode 내에서 프로젝트를 컴파일 할 때, 소스코드를 컴파일 하는 과정에서 이러한 .xib 파일들고 같이 컴파일이 됩니다!!

이렇게 컴파일 된 인터페이스 빌더 파일은 
".nib" 파일로 저장되어 사용됩니다!!

<br>

<img width="443" alt="스크린샷 2020-10-16 오후 9 43 26" src="https://user-images.githubusercontent.com/60260284/96259484-a1746d00-0ff8-11eb-9bde-ca97c5496a67.png">
실제로 우리가 사용하는 스토리보드는 실제로 여러 개의 뷰에 대한 .nib 파일들을 모아둔 번들 개념입니다. 


<img width="301" alt="스크린샷 2020-10-16 오후 9 44 08" src="https://user-images.githubusercontent.com/60260284/96259546-b9e48780-0ff8-11eb-91ba-74fab90d0b2f.png">

즉, 스토리보드 내에 있는 각각의 뷰들은 개별 nib 파일인 셈입니다!

따라서 뷰와 뷰를 연결하는 방법은 존재하지만, 
동일한 모든 속성을, 모든 스토리보드 내에서 공유하는 것은 설정이 불가능합니다

--> 왜???!?!?!?!
스토리보드에 있는 뷰는 각각 독립된 .nib 파일로 존재하기 때문입니다.

<img width="657" alt="스크린샷 2020-10-16 오후 9 46 08" src="https://user-images.githubusercontent.com/60260284/96259755-0334d700-0ff9-11eb-9db2-60864a1668bf.png">

대신, 스토리보드는 개별 뷰들의 nib 파일 외에 각 뷰 들이 어떻게 연결될 것인가에 대한 정보를 별도로 추가가 가능합니다.

각 뷰들이 어떤 관계를 갖고 연결되는지를 나타내는 개념이 바로 
"SEGUE"
입니다!!

세그를 설명하기 전까지 부연설명이 넘 길었네여 죄송해여...


방금 부연 설명을 길~~~~~게 한 세그는 
2가지 속성만 갖게 됩니다

1. Source : 전환시, 시작점에 해당하는 뷰 컨트롤러
2. Destination : 전환하고자 하는 도착점에 해당하는 뷰 컨트롤러

<img width="422" alt="스크린샷 2020-10-16 오후 9 49 27" src="https://user-images.githubusercontent.com/60260284/96260076-78a0a780-0ff9-11eb-9ae6-98823907b041.png">

이렇게 전달되는 과정에서

```Swift
prepare(for: sender)
```
라는 함수가 같이 호출됩니다!!

저희는 여기에 전달할 데이터를 담을 예정입니다

<img width="605" alt="스크린샷 2020-10-16 오후 9 51 13" src="https://user-images.githubusercontent.com/60260284/96260232-b9002580-0ff9-11eb-84aa-2d8f2d9ca84f.png">

이렇게 segue의 destination이 ThirdViewController 라면, ThridViewController 형태로 vc에 할당을 하고, 거기에 접근해서 데이터를 넘기는 방식입니다!!


---

### 3. 프로퍼티와 함수를 이용해서 데이터 받기 (B->A)

첫번째와 두번째에서는 A->B 구조로, 직접 프로퍼티에 접근해서 데이터를 전달했는데
이미 전환된 B에서 A로 데이터에 접근해서 넘길 때는 어떤 방법을 사용할까요?!

여러가지 방법이 있지만, 첫번째로는
B에서 A에 대한 참조를 만들고, A에 속한 함수를 B에서 호출하는 방법이 있습니다.

<img width="1193" alt="스크린샷 2020-10-16 오후 9 55 15" src="https://user-images.githubusercontent.com/60260284/96260667-493e6a80-0ffa-11eb-9e43-b16816269804.png">


(전달받는 메인 뷰컨)
<img width="1225" alt="스크린샷 2020-10-16 오후 9 56 37" src="https://user-images.githubusercontent.com/60260284/96260799-7854dc00-0ffa-11eb-8d02-715f84c1085b.png">




```Swift
    func onThridVCAction(data : String)
    {
        self.propertyFunctionTextLabel.text = data
    }
```

미리 onThirdVCAction이라는 데이터를 받는 함수를 메인 뷰컨에 만들어두고,

```Swift
    @IBAction func thrid(_ sender: Any) {
        
        guard let vc =  storyboard?.instantiateViewController(identifier: "fourthViewController") as? FourthViewController else
        { return }
        
        vc.mainVC = self
        
        self.navigationController!.pushViewController(vc, animated: true)

        
    }
```

데이터를 넘기는 부분에 해당 뷰컨을 선언하고, 거기에 존재하는 뷰컨 프로퍼티를 본인이라고 지정을 해줍니다!! <br>
 (데이터를 받는 뷰컨이 자기자신이다!!  라는 의미)


```Swift
class FourthViewController: UIViewController {

    
    var mainVC : ViewController?

    @IBOutlet weak var dataTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBAction func buttonClicked(_ sender: Any) {

        mainVC?.onThridVCAction(data: self.dataTextField.text ?? "")
        
        self.navigationController?.popViewController(animated: true)
    
    }

```

전달하는 뷰컨에서는 ViewController 변수를 선언해두면은

아까 우리가 메인에서 선언해둔 <code> onThirdVCAction </code> 라는 함수를 호출해서, 그 함수 매개변수에 전달하고자 하는 데이터를 넣어 전달하는 방식입니다.

근데 사실 이 방법은 잘 쓰이지 않는 방법이고,

<img width="750" alt="스크린샷 2020-10-16 오후 10 04 01" src="https://user-images.githubusercontent.com/60260284/96261514-822b0f00-0ffb-11eb-8d05-78cef6beae25.png">
두개의 뷰컨 사이에 서로 
"Tightly Coupled" 상태로,
서로의 뷰컨 관계가 상호적으로 묶여있는 형태입니다!!

서로 함수에 의존해서 데이터를 전달하는 방식이기 때문에 결국 뷰컨에 뷰컨이 이어지고.. 스파게티 코드가 초래 가능합니다<br>
(이렇게 되면 나중에 유지 보수 할 때 알 수 없는 늪에 빠지게 됩니다 ㅠ_ㅠ....)


### 4. Delegation을 이용해서 데이터 받기

아까 이전 프로퍼티/함수 형태의 단점을 보완하기 위해서 사용하는 형태가 Delegation 입니다!!
Delegation을 사용하면 아까 3번과 달리 두개의 클래스가 연관된 것이 아닌 각각 떨어져 있는 상태가 됩니다!
(decoupled 상태라고 불러요!!)

델리게이트는 어떤 객체가 해야 하는 일을 부분적으로 확장을 해서 대신 처리를 하는 방식입니다.

[자세한 delegate 를 알고 싶다면 여기로...](https://zeddios.tistory.com/8)
(출처 :zeddios 블로그)


(전달받는 뷰컨)
<img width="655" alt="스크린샷 2020-10-16 오후 10 06 39" src="https://user-images.githubusercontent.com/60260284/96261814-e0f08880-0ffb-11eb-94d9-e11ad94d3985.png">



(전달하는 뷰컨)
<img width="659" alt="스크린샷 2020-10-16 오후 10 09 46" src="https://user-images.githubusercontent.com/60260284/96262103-4f354b00-0ffc-11eb-981c-ebd38e7360fd.png">


(전달하는 뷰컨)
<img width="658" alt="스크린샷 2020-10-16 오후 10 10 22" src="https://user-images.githubusercontent.com/60260284/96262172-65430b80-0ffc-11eb-807e-2e52f4383d00.png">


전달하는 뷰컨에서는 Myprotocol 이라는 프로토콜을 생성해두고, 함수를 정의하기만 하고
자세한 구현은 해두지 않습니다!!
전달하는 뷰컨에서는 

```Swift
  var delegate : MyProtocol?
```
다음과 같이 MyProtocol 를 선언해두고

```Swift
    @IBAction func buttonClicked(_ sender: Any) {
        self.delegate?.protocolData(dataSent: self.textField.text ?? "")
        self.navigationController?.popViewController(animated: true)
    }
```

아까 선언해둔 MyProtocol의 함수에다가 데이터를 넣어서 전달을 합니다!!




그렇게 하고, 전달 받는 메인 뷰컨에서 아까 만들어둔 MyProtocol을 채택합니다!

<img width="455" alt="스크린샷 2020-10-16 오후 10 12 24" src="https://user-images.githubusercontent.com/60260284/96262384-ad622e00-0ffc-11eb-9c55-050f351a0664.png">

해당 함수를 프로토콜을 채택하게 되면 아까 만들어둔 함수를 선언해야만 하고, 그 함수에 대해 구현을 하면 됩니다!

<img width="431" alt="스크린샷 2020-10-16 오후 10 13 47" src="https://user-images.githubusercontent.com/60260284/96262532-de426300-0ffc-11eb-871f-8a65d4f4e7b6.png">

mainViewController 에서 다음과 같이 protocolData에 대해 상세 구현( 즉, 아까 전달받은 데이터를 표기하는 것) 을 하면 됩니다!!

delegate에 대해 설명이 너무 부족하다면 위에 올린 링크를 한번 참고해보세요!!
Delegate 패턴은 스위프트 내에서 자주 사용하는 형태라 꼭 숙지해두셔야 합니다!!


---
### 5. 클로저로 데이터 전달하기


- 클로저란?
" { } 형식을 가진 하나의 '코드블럭' "

-> 
1. 코드 안에서 사용 될 수 있는 것
2. 매개 변수로 전달 될 수 있는 것
<img width="609" alt="스크린샷 2020-10-16 오후 10 16 26" src="https://user-images.githubusercontent.com/60260284/96262800-3ed1a000-0ffd-11eb-8105-8d93b0d4a286.png">

(애플 공식 문서에서 정의하는 클로저)

클로저는 코드를 간결하게 작성하기 위해 사용됩니다!!

혹시 ,,, 클로저에 대해 설명이 궁금하다면,,,,
[여기로....](https://medium.com/@jgj455/%EC%98%A4%EB%8A%98%EC%9D%98-swift-%EC%83%81%EC%8B%9D-closure-aa401f76b7ce)
(출처 : 장국진님 개발 블로그)

클로저를 쓰는 것이 프로퍼티에 접근해서 전달하는 것, delegate 패턴을 이용해서 전달하는것과 크게 형태가 다르지는 않지만
클로저를 사용해서 얻는 장점은

1. 쓰기 간결하다
2. 프로토콜이나 함수의 사용없이 지역 변수 스코프 내에서 처리가 가능하다

등이 있습니다
(전달하는 뷰컨)
<img width="637" alt="스크린샷 2020-10-16 오후 10 19 27" src="https://user-images.githubusercontent.com/60260284/96263174-ab4c9f00-0ffd-11eb-8b70-2cb126fd2895.png">

전달하고자 하는 뷰컨에서

```Swift
    var completionHandler: ((String) -> (String))?
```
컴플리션 핸들러, 즉 클로저를 만들어두고

```Swift
        _ = completionHandler?(self.textField.text ?? "")

```
아까 만들어둔 클로저에다가 전달할 데이터를 넣습니다



(받는 뷰컨)

<img width="682" alt="스크린샷 2020-10-16 오후 10 21 50" src="https://user-images.githubusercontent.com/60260284/96263464-ff578380-0ffd-11eb-98d8-4b353259d884.png">

그리고 받고자 하는 뷰컨에서는 

```Swift
        guard let vc =  storyboard?.instantiateViewController(identifier: "sixthViewController")
            as? SixthViewController else
        { return }
```
아까와 똑같이 뷰컨을 선언해두고,

```Swift
        vc.completionHandler =
            {
                text in
                
                self.closureTextField.text = text
                return text
        }
```
해당 뷰컨에 있는 클로저를 호출해서 거기에 있는 데이터를 받아서 텍스트 라벨을 설정하는 형태입니다!!

--- 
### 6. NotificationCenter를 이용한 데이터 전달

- NotificationCenter란?

 NotificationCenter는 하나의 방송국 개념으로
 
 데이터를 송신하는 post 부분과 <br>
 데이터를 수신하는 observer 부분 <br>
 으로 구성되어 있습니다!

보통 연결되어 있지 않고, 독립적으로 서로 뷰 컨트롤러가 존재할 때 사용하는 방법입니다.
(사실 잘 모르겠으면 Notification으로 전달하면 앵간한거 다 됩니다 ^^;)
하지만, 모든 데이터를 이런식으로 넘기면 상당히 비효율적인 방법이고, 계속 observe 하고 있는 방법이라 간단한 데이터를 넘길 때 적합한 방법입니다.

대신, post 를 하기 이전에 observer가 미리 메모리 상에서 존재해야 해당 신호를 듣고 반응을 할 수 있습니다!! <br>
혼자 post 를 한다고 해서 데이터가 받아지지는 않습니다...!


NotificationCenter를 사용하는 방법은 다음과 같습니다

먼저 데이터를 받는 쪽에서
```Swift 
NotificationCenter.default.addObserver(self, selector: #selector(loadList), name: NSNotification.Name(rawValue: "load2"), object: nil)
```

load2 라는 이름을 가진 신호를 수신 할 수 있도록 observer를 달아둡니다.


```Swift
@objc func loadList(_ notification : NSNotification)
{
	// 실행되는 부분...
	let data = notification.object as? String ?? ""

}
```

해당 신호가 들어오면 <code> selector</code> 에 있는 함수가 실행됩니다!!

전달받은 data를 가공해서 처리하고 싶다면 <code>  notification.object </code>로 접근해서 데이터를 빼온 뒤에, 알아서 슥슥 쓰시면 됩니다...


이제 데이터를 받는 부분도 만들었으면, 데이터를 전송해야 하는 부분도 만들어야겠죠?!
데이터를 전달하고 하는 부분에

```Swift
NotificationCenter.default.post(name: NSNotification.Name(rawValue: "load2"), object: yourText)

```

yourText 라는 데이터를 load2 라는 신호 형태로 post 하게 됩니다!!

그럼 아까 만들어둔 


```Swift
NotificationCenter.default.addObserver(self, selector: #selector(loadList), name: NSNotification.Name(rawValue: "load2"), object: nil)
```
에서 해당 observer 가 작동을 하고 loadList 라는 함수를 실행시키게 됩니다,,!



---




