# JustLift  <br>  <img src="https://img.shields.io/badge/SwiftUI-50B3D6?style=flat-square&logo=Swift&logoColor=white" />  <img src="https://img.shields.io/badge/Combine-0071e3?style=flat-square&logo=Swift&logoColor=white" />
<Blockquote>
역도 연습 일지 프로젝트로, 훈련의 강도 컨디션등을 기록할수 있는 어플입니다 
</Blockquote>

## ⚙️ 개발환경
- Xcode: 14.0
- Swift: 5.7
- iOS: 13.0 ~ 

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

## 🏋🏻‍♀️ 기술적 도전 
<Blockquote>
프로젝트를 진행하면서 시도한 기술적 도전을 소개합니다.
</Blockquote>

### 💬 FCM

### 🚜 Combine
- 애플에서 직접 제공하는 First Party Framework을 사용하여 비동기프로그래밍에 도전하였습니다.

### 🛠 MVVM
- MVVM 패턴을 적용하여, 뷰는 화면을 그리는 역할/ 뷰모델은 데이터 가공과 로직을 실행하는 역할로 나누어 구현했습니다.
   - 예를들어, 뷰모델에는 데이터 형태르 원하는 형태로 가공으 하거나, combine @Published를 사용해 데이터가 변했을 때, update 할수 있는 로직들이 포함되어 있습니다
- 뷰에 뿌릴 값들을 뷰모델에서 가공하고, 이를 유닛 테스트를 통해 검증할 수 있었습니다. 
