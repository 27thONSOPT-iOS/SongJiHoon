# 1주차 과제



<img src="https://user-images.githubusercontent.com/60260284/96102574-a3173580-0f11-11eb-9a21-cf523665527a.png">





[파일로 이동하기](https://github.com/27thONSOPT-iOS/SongJiHoon/tree/master/%EA%B3%BC%EC%A0%9C/firstWeek_Assignment)

### 목표 : present,push,pop을 이용해 화면전환 및 데이터 전달하기

구현 결과물 <br>
![전체 플로우](https://user-images.githubusercontent.com/60260284/96204342-03a08400-0f9f-11eb-97ca-872b0d7e4aab.gif)


메인 화면 -- (present) -> 로그인뷰

로그인뷰 -- (push) --> 회원가입 뷰

로그인 뷰에서 로그인 -- (dismiss) --> 메인에 데이터 전달



---

## 화면 Present로 모달 띄우기


present로 모달을 띄우는 방식은, 보통 앱 UI를 설계할 때,
현재 보고있는 내용에서 새로운 내용을 깊이가 깊지 않은 방식으로 보여줄 때 사용하는 방식입니다.

나중에 앱을 설계할 때, modal로 처리할지 push 로 처리할지는 사용자 입장에서도 중요한 요소이기 때문에 여러 앱을 보면서 생각을 해보는 것도 좋은 방법입니당


(전체코드)
```Swift

    @IBAction func loginButtonClicked(_ sender: Any) {

        

        guard let loginVC = self.storyboard?.instantiateViewController(identifier: "loginNavi") else {return}

        loginVC.modalPresentationStyle = .fullScreen

        self.present(loginVC, animated: true, completion: nil)
        
    }
```


```Swift
guard let loginVC = self.storyboard?.instantiateViewController(identifier: "loginNavi") else {return}
```
현재 같은 스토리보드를 사용하는 뷰컨트롤러중에서
"loginNavi"를 사용하는 스토리보드를 선언한다!!

<img width="705" alt="스크린샷 2020-10-16 오전 11 37 34" src="https://user-images.githubusercontent.com/60260284/96206501-ff2a9a00-0fa3-11eb-9eea-2c661d922b7a.png">

현재 스토리 보드 구성은 다음과 같습니당
메인에서 로그인하기 버튼을 누르면 

<img width="725" alt="스크린샷 2020-10-16 오전 11 38 19" src="https://user-images.githubusercontent.com/60260284/96206538-19fd0e80-0fa4-11eb-9cac-8e5cf3628545.png">

이렇게 loginNavi 스토리보드 ID를 가진 navigation Controller로 전환하기 위해 다음과 같이 코드를 작성했습니다!



```Swift
loginVC.modalPresentationStyle = .fullScreen
```

modal을 띄울 때 전체로 띄우기 위해서 .fullscreen 을 사용하고,

```Swift
self.present(loginVC, animated: true, completion: nil)
```

설정해둔 VC를 present 를 이용해 화면을 전환했습니다

---
## 화면 push 하기

push 는 네비게이션을 활용해 stack 형태로 뷰를 쌓아나가는 방식입니다. 

<img width="1123" alt="스크린샷 2020-10-16 오전 11 41 00" src="https://user-images.githubusercontent.com/60260284/96206700-795b1e80-0fa4-11eb-8703-01ce3a48c6cc.png">

다음 화면으로 전환되면 뷰컨트롤러가 쌓이고
pop을 하게되면 현재 뷰컨이 메모리가 해제되고, 이전 화면이 보이게 되는 방식입니다.



우선 아까 present를 할때 스토리보드를 선언한 것 처럼

```Swift

        guard let signupVC = self.storyboard?.instantiateViewController(identifier: "SignupViewController" ) as? SignupViewController else {return}
```
다음과 같이 SignupViewController 라는 이름을 가진 뷰컨을 선언하고



```Swift
self.navigationController?.pushViewController(signupVC, animated: true)
```

push 를 해주게 되면 넘어가게 됩니다!!

뒤로가는 pop은

```Swift
self.navigationController?.popViewController(animated: true)
```

이미 스택에 뷰컨트롤러가 쌓인 상태이기 때문에, 새로운 뷰컨을 선언하는 것이 아닌 간단하게 pop으로 가능합니다!!

--- 

### dismiss 하면서 데이터 전달하기

현재 구조가 메인 -> 로그인 뷰로 present 되어있는 상태고,
dismiss 하면서 데이터를 전달해야하는 방법입니다.

현재 다음과 같은 구조에서는
직접 
```Swift
        guard let signupVC = self.storyboard?.instantiateViewController(identifier: "SignupViewController" ) as? SignupViewController else {return}
        
        signupVC.a = "데이터 넣을게여"
        
        self.navigationController?.pushViewController(signupVC, animated: true)
```
이런식으로 직접 프로퍼티에 접근해서 데이터를 전달하는 방식은 push 나 present 경우에만 가능합니다. 새로운 뷰컨트롤러를 할당해서 전달하는 것은 가능하지만
dismiss 나 pop 같은 경우에는 이미 생성된 뷰컨 위, 혹은 stack 에다가 쌓아두고 새로운 뷰컨을 올리는 방식이라 위 내용과 같은 방식으로는 데이터 전달이 불가능합니다

방법은 총 4가지가 있는데

1. 프로퍼티와 함수를 활용하는 방법
2. Delegation 활용하기
3. Closure 활용하기
4. NotificationCenter 활용하기

우선은 NotificationCenter를 활용하는 방법을 이번 과제에서는 사용해보도록 하겠습니당
나머지는 차차 설명할게요 ^^,,,

NotificationCenter라는 것은 서로 연결되어있지 않은 뷰컨들 사이에서 신호를 전달하고 데이터를 전달할 때 주로 사용하는 방법인데,

한 뷰컨에서는 신호를 post 하고,
받는 뷰컨에서는 미리 observer를 달아두어서 신호를 받을 수 있도록 대기하는 것이라고 생각하시면 됩니당

(하나의 방송국 개념!!)
<br>

그래서 저는 이번 로그인 뷰컨에서 데이터를 post 하고,
메인에서 observer를 달아둬서 데이터를 전달하는 방법을 사용했습니다 
<br>


(로그인뷰 전체코드) 

```Swift
import UIKit

class LoginViewController: UIViewController {

    
    @IBOutlet weak var partTextField: UITextField!
    
    @IBOutlet weak var nameTextField: UITextField!
    
    
    var personalInfo : [String] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    

    @IBAction func loginButtonClicked(_ sender: Any) {
        
        
        
        self.personalInfo.append(partTextField.text ?? "")
        self.personalInfo.append(nameTextField.text ?? "")
        
        
        NotificationCenter.default.post(name: NSNotification.Name("dataReceived"), object: self.personalInfo)
        
        dismiss(animated: true, completion: nil)
    }
    
    
    @IBAction func signupButtonClicked(_ sender: Any) {
        
        guard let signupVC = self.storyboard?.instantiateViewController(identifier: "SignupViewController" ) as? SignupViewController else {return}
        
        
        
        self.navigationController?.pushViewController(signupVC, animated: true)
    }
    

}

```



```Swift
 var personalInfo : [String] = []
```

우선 해당 뷰컨 클래스에 데이터를 전달할 personalInfo 라는 스트링 리스트를 만들어두어서 여기에 파트/이름을 저장하려고 했습니다




```Swift
        self.personalInfo.append(partTextField.text ?? "")
        self.personalInfo.append(nameTextField.text ?? "")

```
그 다음 personalInfo 리스트에 현재 텍스트 필드에 있는 내용을 append 해주고,


```Swift
        NotificationCenter.default.post(name: NSNotification.Name("dataReceived"), object: self.personalInfo)
```


NotificationCenter 에다가 dataReceived 라는 신호 이름을 가지고, personalInfo 데이터를 날려보냅니다!!


그 다음 이제 홈 화면을 보면은
우선 전체코드 부터,,

```Swift
import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var partTitleLabel: UILabel!
    
    @IBOutlet weak var partLabel: UILabel!
    
    @IBOutlet weak var welcomeMessageLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        addObserver()
        
        
        self.partTitleLabel.isHidden = true
        self.partLabel.isHidden = true
        self.welcomeMessageLabel.isHidden = true
    
    }
    
    
    
    func addObserver()
    {
        NotificationCenter.default.addObserver(self, selector: #selector(settingLabel), name: NSNotification.Name("dataReceived"), object:  nil)
    }

    @objc func settingLabel(_ noti : NSNotification)
    {
        let dataList = noti.object as? [String] ?? []
        
        self.partTitleLabel.isHidden = false
        self.partLabel.isHidden = false
        self.welcomeMessageLabel.isHidden = false
        
        self.partLabel.text = dataList[0]
        self.welcomeMessageLabel.text = "\(dataList[1]) 님 안녕하세여 ^~^"
    }
    

    @IBAction func loginButtonClicked(_ sender: Any) {

        

        guard let loginVC = self.storyboard?.instantiateViewController(identifier: "loginNavi") else {return}

        loginVC.modalPresentationStyle = .fullScreen

        self.present(loginVC, animated: true, completion: nil)
        
    }
    
}


```



```Swift
    func addObserver()
    {
        NotificationCenter.default.addObserver(self, selector: #selector(settingLabel), name: NSNotification.Name("dataReceived"), object:  nil)
    }

```


다음과 같이 미리 dataReceived 라는 신호 이름을 수신 할 수 있는 NotificationCenter 활용해서 observer를 만들어 두어서
메모리 상에 올려두었습니다.  해당 dataReceived 라는 신호가 들어오면 settingLabel 이라는 함수가 실행되는 형태입니다!!



```Swift
    @objc func settingLabel(_ noti : NSNotification)
    {
        let dataList = noti.object as? [String] ?? []
        
        self.partTitleLabel.isHidden = false
        self.partLabel.isHidden = false
        self.welcomeMessageLabel.isHidden = false
        
        self.partLabel.text = dataList[0]
        self.welcomeMessageLabel.text = "\(dataList[1]) 님 안녕하세여 ^~^"
    }
```

settingLabel 함수가 실행되면, 해당 noti를 [String] 형태로 타입을 정해주고, 숨겨뒀던 라벨을


```Swift
        self.partTitleLabel.isHidden = false
        self.partLabel.isHidden = false
        self.welcomeMessageLabel.isHidden = false

```
보이게 한다음에 

```Swift
        self.partLabel.text = dataList[0]
        self.welcomeMessageLabel.text = "\(dataList[1]) 님 안녕하세여 ^~^"

```

라벨 텍스트를 설정해줍니다아~~~~


이 방법 말고도 위에 설명한 3가지 방법이 더 있는데요!
다음에 설명하겠습니다 ^_^
