# 35-APPJAM-iOS-GONGBAEK

## 공강을 백으로 채우다, 공백 🧩
![Slide 16_9 - 138](https://github.com/user-attachments/assets/5aa9c6cc-2d50-4970-b3da-b2f6fcef7304)


**공백**은 **공강 시간을 특별하게** 채울 수 있는 서비스입니다!

우리는 공강이라는 공백 속에서 **더 많은 연결과 경험**을 발견하고,

이를 통해 **더욱 의미 있고 즐거운 대학 생활**을 만들어갈 수 있습니다.

**공백**이 당신의 공강 시간을 특별하게 채우는 친구가 되어드릴게요!


## 💡 문제상황 정의
![Slide 16_9 - 153](https://github.com/user-attachments/assets/04fd99dd-74b1-473f-8154-cd90419c9223)

## 📍 주요 기능
![Slide 16_9 - 168](https://github.com/user-attachments/assets/02a3b6cc-b8e6-42b0-8b4e-c9934d302d2f)
![Slide 16_9 - 174](https://github.com/user-attachments/assets/646fdfb9-995e-4217-a53c-3083e9bbf4d2)
![Slide 16_9 - 170](https://github.com/user-attachments/assets/570ce69f-972d-4994-a9ee-4e30026eaed4)


## 👩‍💻 About Developers

| 김나연 | 김민서 | 김희은|
| --- | --- | --- |
| <img src="https://github.com/user-attachments/assets/5e37163f-7157-460c-abaf-4ab3a1348fb61" width="200" align="center"> | <img src="https://github.com/user-attachments/assets/7c65353d-8c7b-433f-9663-19413e2d5b25" width="200" align="center"> | <img src="https://github.com/user-attachments/assets/831a2f95-dbd7-4d23-9d98-345732abd8ec" width="200" align="center"> |
| <p align="center">`스플래시/온보딩`<br>`홈`</p> | <p align="center">`나의 채움`<br>`모임 등록하기`<br>`채우기`</p> | <p align="center">`채우기 상세 페이지`<br>`모임방`</p> |

## 🐈‍⬛ GitFlow
![깃플로우](https://github.com/user-attachments/assets/704515f3-9ca4-42e7-a46b-e2456fe96531)
- Setting : 초기 프로젝트 세팅
- Feat : 기능 구현, 추가
- Chore : 간단한 수정, 코드 정리
- Add : Feat 외의 부수적인 코드 추가
- Delete : 불필요 코드 삭제
- Fix : 오류 해결
- Refactor : 전반적인 리팩토링
- Docs : 문서 작성

## 📒 Library & stack
| 라이브러리         | 목적                                           | 버전(Version)                                                |
| ------------------- | --------------------------------------------- | ------------------------------------------------------------ |
| Moya               | 간결한 네트워크 요청과 구조화된 관리 방식으로 코드 가독성과 유지보수성 향상 | ![Moya](https://img.shields.io/badge/Moya-15.0.3-orange)      |
| Combine            | 비동기 이벤트 처리를 위한 프레임워크로, 데이터 스트림을 효과적으로 처리하고 리액티브 프로그래밍을 지원 | 내장 라이브러리 |
| Lottie             | 애니메이션 파일(JSON) 렌더링 및 UI 인터랙션 강화 | ![Lottie](https://img.shields.io/badge/Lottie-4.2.0-blue)     |


## 📏 Code Convention
[🧩 공백 Code Convention](https://www.notion.so/Code-Convention-5a9c6a4435e0441d9b84ad289aa11660?pvs=4)

##  📁 Foldering
```bash
├── 📁 Application
│   ├── Gongbaek_iOSApp
├── 📁 Global
│   ├── 🗂️ Protocol
│   ├── 🗂️ Extension
│   ├── 🗂️ Literal
│   │   ├── String
│   ├── 🗂️ Components
│   │   ├── 🗂️ Button
│   │   ├── 🗂️ Bar
│   │   ├── 🗂️ TextField
│   │   ├── 🗂️ ...
│   ├── 🗂️ Resource
│   │   ├── Font
│   │   ├── Assets
│   ├── 🗂️ Setting
│   │   ├── Info.plist
│   │   ├── Configurations
│   │   │   ├── Development
│   │   │   ├── Config
├── 📁 Network
│   ├── 🗂️ Service
│   │   ├── DTO
│   │   ├── TargetType
│   ├── 🗂️ Base
│   ├── 🗂️ Environment
├── 📁 Presentation
│   ├── 🗂️ View1
│   │   ├── 🗂️ Model
│   │   ├── 🗂️ View
│   │   │   ├── 🗂️ Cell
│   │   ├── 🗂️ ViewModel
```



