# JustLift  <br>  <img src="https://img.shields.io/badge/SwiftUI-50B3D6?style=flat-square&logo=Swift&logoColor=white" />  <img src="https://img.shields.io/badge/Combine-0071e3?style=flat-square&logo=Swift&logoColor=white" />
<Blockquote>
역도 연습 일지 프로젝트로, 훈련의 강도 컨디션등을 기록할수 있는 어플입니다 
</Blockquote>

## ⚙️ 개발환경
- Xcode: 14.0
- Swift: 5.7
- iOS: 14.0 + (@StateObject 사용으로 iOS 14.0 이상)

## 📁 구조
- Firebase/ : GoogleService-Info-Prod.plist, GoogleService-Info-Dev.plist 파일이 있으며, .gitignore 에 추가해놓았습니다.
- LiftList/ : 전체 역도 훈련 일지를 확인할 수 있습니다.
- LiftDetail/ : 그날의 상세 훈련강도와 컨디션을 확인할 수 있습니다.
- LiftCreate/ : 역도 훈련을 기록할 수 있습니다.
- Model/ : 앱에 필요한 데이터 모델입니다.

## 🛠 Architecture : MVVM
<Blockquote>
프로젝트에서 사용하고 있는 프로젝트 구조 입니다.
</Blockquote>

### Model : 저장되어야할(기록되어야할) 데이터 형식을 정의합니다.
### View : 보여지는 부분을 담당합니다.
### ViewModel : 추가,삭제의 기능을 담당하며, 이외의 로직(데이터포맷변경..)을 담당합니다.

## 🍏 좋은 설계를 위한 노력
<Blockquote>
좋은 설계를 위해 프로젝트에서 지키려고 한 노력입니다.
</Blockquote>

### OOP - Encapsulation
- 낮은 결합도를 위해, private 접근제어자를 사용하였습니다.

### final 키워드
- 성능 향상을 위해 상속 되지 않는 class 에 final 키워드를 붙였습니다.
- 키워드를 붙이면, Static Dispatch가 사용이 되어, 컴파일에 결정이 되고 런타임에 그대로 실행이 되어 성능이 보다 향상 됩니다.

### @StateObject
- StateObject로 생성된 객체는 View의 life cycle에 상관없이, SwiftUI가 메모리에 별도 관리하기 때문에 데이터가 일관됩니다.

## 🏋🏻‍♀️ 기술적 도전 
<Blockquote>
프로젝트를 진행하면서 시도한 기술적 도전을 소개합니다.
</Blockquote>

### 💬 FCM

### 🚜 Combine
- 애플에서 직접 제공하는 First Party Framework을 사용하여 비동기프로그래밍에 도전하였습니다.

### 🛠 MVVM
- MVVM 패턴을 적용하여, 뷰는 화면을 그리는 역할/ 뷰모델은 데이터 가공과 로직을 실행하는 역할로 나누어 구현했습니다.
   - 예를들어, 뷰모델에는 데이터 형태를 원하는 형태로 가공을 하거나, combine @Published를 사용해 데이터가 변했을 때, update 할수 있는 로직들이 포함되어 있습니다
- 뷰에 뿌릴 값들을 뷰모델에서 가공하고, 이를 유닛 테스트를 통해 검증할 수 있었습니다. 
