# 선박 관제 시스템

github: https://github.com/devcsw/shipControl  
사용언어: CSS3, HTML, JavaScript, java  
사용툴: bootstrap, oracle, slack, spring, tomcat, 카카오지도API  
업무포지션: 팀프로젝트  
주요기술: spring websocket을 통한 실시간 선박 관제 시스템 개발  
투입기간: 2021/07/01 → 2021/07/23  
팀원: 김노현, 최성우  

[프로젝트 타임라인 ](https://www.notion.so/e4336def1075482cbf6dd5027dd0bcbb)

[프로젝트 환경](https://www.notion.so/d319cc5d09b8473fa497422ce852d885)

## 프로젝트 개요

- 실시간 선박 센서 데이터를 통한 상태 감시 및  예지보전 
- 조난, 사고 등 초기 대응을 위한 관제 

## 초기 설계

---

### 선박 관제 페이지 FlowChart
![1 sControl_flow](https://user-images.githubusercontent.com/33865991/127798563-81cb2de5-8e44-4d92-955d-04d77190ce1c.png)

- 초기 설계에서는 사고 데이터를 전송 받아 데이터를 전송 하는 방식으로 설계를 진행했었는데 해양 사고 자체로는 5천 건 정도로 적은 횟수를 가지고 있어 계속해서 로우 데이터를 보내는 방식으로 수정 .

### 선박 관리 페이지 FlowChart

![2 sManage_flow](https://user-images.githubusercontent.com/33865991/127798653-ddac69ef-e07e-4dc4-8ce6-331f88acd982.png)

- 통신 방식을 AJAX로 할지 Socket으로 할지 정하는 과정에서 기존에 알고 있던 AJAX방식으로 설계함 현재는 Socket을 통해 지속적으로 데이터 송수신 중

### 선박 관제 현황 StoryBoard

![3 main_story](https://user-images.githubusercontent.com/33865991/127798658-5fde4043-8cec-461e-9e3d-db8383a6650a.png)

### 선박관리 StoryBoard

![4 manage_story](https://user-images.githubusercontent.com/33865991/127798662-c21f2df1-1cba-4223-83df-429922dc8856.png)

### 관리내역 초기 StoryBoard

![5 ship_flow](https://user-images.githubusercontent.com/33865991/127798663-62be7bd8-4cec-4f67-87d1-286c5a422028.png)

## 🚢 프로젝트 내용

### 데이터베이스 ERD

---

![6 RIUDFV9](https://user-images.githubusercontent.com/33865991/127798669-08c1f292-15bf-43c3-91cd-8e19b03de18a.png)

### 선박 관제 페이지

소켓 통신 기반 실시간 위치 추적 및 상태 확인 페이지

---

![7 Animation](https://user-images.githubusercontent.com/33865991/127798679-347b5ef0-3a78-4a6d-b1c5-99046508390b.gif)

- 선박 데이터를 소켓통신을 통해 화면에 출력
- 선박 데이터에 따라 상태변경
- 카카오 지도 api drawing library를 통한 구역 설정 기능(미구현)

![8 infowindow](https://user-images.githubusercontent.com/33865991/127798681-424c98d0-6048-4565-a78f-514c97db5f1e.gif)

- 선박 클릭 시 현황 표시
- 선박의 상태 확인 후 조난 내역 등록

### 선박 관리 페이지

선박 상태 관리 페이지

---

![9 control](https://user-images.githubusercontent.com/33865991/127798682-3327f2ab-3f0b-4f81-802f-458080776be0.gif)

---

- 실시간 데이터에 따라 데이터 출력
- 선박 등록 수정 및 센서 내역 확인

### 기타페이지

---

- 선박 등록 모달창

![10 regist](https://user-images.githubusercontent.com/33865991/127798684-f2fbc01e-e107-47ee-89d4-5cd1675e421d.png)

- 선박 수정 페이지

![11 update](https://user-images.githubusercontent.com/33865991/127798685-ad4db7c7-d820-435b-bdef-bc7346768031.png)

- 과거 저장된 데이터 출력 페이지

![12 data](https://user-images.githubusercontent.com/33865991/127798676-d2dc4919-5253-4c51-bb36-9c9486b891e0.png)

[주요 내역](https://www.notion.so/8448ee0d71c548249d47a81299fc588f)

## 😤 이슈 사항

---

1. 초기 화면 설계 중 처리 현황 페이지 제작의 건 
    - 화면 설계에서는 있는 처리현황 버튼은 따로 생성 되어야 하는 버튼이라서 필요 없다고 했는데, 이해할때는 왜 따로 처리현황을 보여주는지에 대한 부분으로 오해해서 이후 이슈 생성 시 어떤 부분(화면, DB, 통신)에서 생기는 문제인지 먼저 인지 한 후에 진행 하도록 함.

 2. 실시간 데이터를 통한 자동 사고 신고 기능 추가의 건

- 데이터는 계속해서 오류 신호를 보내는데 어느 시점 부터 언제까지 데이터를 오류라 지칭하고 사고신고 처리로 넘길지에 대해 자동으로 처리시에는 개발 기간 안에 추가는 어렵다고 생각되서 추가 개발 건으로 변경

## 😀 추가 및 수정 사항

---

1. **카카오지도 API**
    - 위험 구역 설정 기능
    - 특이사항 발생 시 메세지 전송 기능
2. **통계**
    - 저장 데이터 기반 통계 대시보드 페이지 구현
3. **유효성 검사**
    - 유효성검사 편의성 확인 후 수정.
4. **실시간 데이터 사고처리 기능**
    - 선박에서 자동으로 보내는 데이터를 활용하여 사고 구분 처리
5. **관리자 페이지**
    - 화면 구성 관리 페이지

## 프로젝트 후기

---

- 프로젝트 진행을 위해 사용 해보지 않았던 기술 (카카오 지도 API, 소켓통신)을 새로 알아가면서 진행 하다보니 생각했던 것 보다 많은 것을 진행하지 못해 아쉬운 점이 있었음.
- 익숙한 RDB를 사용하여 프로젝트를 진행했는데, 오히려 MongoDB 같은 문서형 데이터베이스를 활용했으면 고민하는 시간이 줄어들어 더 많은 기능과 내용을 담을 수 있을 것 같은 생각이 듬.
