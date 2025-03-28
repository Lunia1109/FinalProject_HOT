# HOT(Have the opportunity to implement)
<img src="https://github.com/user-attachments/assets/8592ffd9-35d9-400e-98cf-7ae4281dd909" style="width: 100%;">
<br>

## ✋ 프로젝트 소개

<table border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="30%">
     <img src="https://github.com/user-attachments/assets/4e66610c-851e-48d1-8f53-9fa0d24da4dc" style="width: 100%"/>
    </td>
    <td width="70%">
      <img src="https://github.com/user-attachments/assets/17e9f339-6cc0-48a0-8bff-09ce75486f88" style="width: 100%;"/>
    </td>
  </tr>
</table>

### 📅 개발 기간 : 2024.06.25 ~ 2024.08.06

<br>



## 👨‍👨‍👧‍👧 팀원 소개
<img src="https://github.com/user-attachments/assets/1f5bb2d6-f4ef-4bd2-9f39-f70c4effd765" style="width: 100%;"/>

<br>
<br>

## ⚙️ 기술 스택
<img src="https://github.com/user-attachments/assets/383fd344-4fb0-43d3-8bcb-002b0c357c82" style="width: 48%; height: 300px;"/>
<img src="https://github.com/user-attachments/assets/916150a1-d754-4247-b437-48e2655ebda2" style="width: 48%; height: 300px;"/>
<br>


## 📃 WBS 및 ERD
<details>
  <summary><b><a href="https://docs.google.com/spreadsheets/d/1NAzd36SRPOj5ouFQyb07qfDOR5NCiR0Whcq16HT539w/edit?usp=sharing"/>WBS</b></summary>
  <br>
</details>

<details>
  <summary><b>ERD</b></summary>
  <br>
  <div markdown="1">
    <ul>
      <img src="https://github.com/user-attachments/assets/edabadf3-6251-49d6-944b-00eb5b7f530b"/>
      <img src="https://github.com/user-attachments/assets/6a93b317-4219-428c-95d6-0b3728e9b78d"/>
    </ul>
  </div>
</details>
<br>


## 🔧 구현 기능

### (1) 채팅 서비스

<details>
  <summary><b>File 구조</b></summary>
  <br>
  <div markdown="1">
    <ul>
      <img src="https://github.com/user-attachments/assets/6aceacfc-63cd-411b-8647-34e31701ea70"/>
    </ul>
  </div>
</details>

<details>
  <summary><b>기능 1. SpringBoot WebSocket을 활용한 채팅 기능</b></summary>
  <br>
  <div markdown="1">
    <ul>
      <img src="https://github.com/user-attachments/assets/bc32f525-025a-4c91-8523-0754dca9e23d"/>
      <em> 개인 채팅방의 경우 상단에 상대방의 상태 및 상태 메세지가 출력되며 그룹 채팅방의 경우 채팅방 이름, 채팅방 개설 일자가 출력됨 </em>
    </ul>
  </div>
</details>

<details>
  <summary><b>기능 2. 채팅 파일 전송 및 다운로드</b></summary>
  <br>
  <div markdown="1">
    <ul>
      <img src="https://github.com/user-attachments/assets/a014656a-8deb-4731-80b6-b3da4b666132"/>
      <em> 채팅창에서 파일 전송 기능으로 사진의 경우 정규 표현식을 활용하여 미리보기 기능 구현, 모든 파일에 대해서는 클릭 시 다운로드 가능 </em>
    </ul>
  </div>
</details>

<details>
  <summary><b>기능 3. 그룹 채팅방 생성 기능</b></summary>
  <br>
  <div markdown="1">
    <ul>
     <img src="https://github.com/user-attachments/assets/d8870561-3880-43a0-9e97-0c4dc7627fdf"/>
      <em> Bootstrap의 Modal 창을 활용하여 그룹 채팅방을 생성할 수 있는 기능 </em>
    </ul>
  </div>
</details>

<details>
  <summary><b>기능 4. 상태(Online, Offline, Meeting 등), 상태 메세지(사용자 지정 임의 메세지) 변경 기능</b></summary>
  <br>
  <div markdown="1">
    <ul>
     <img src="https://github.com/user-attachments/assets/19014bad-9e08-445e-a159-499290f55b77"/>
      <em> 상태 변경, 상태 메세지 변경 시 다른 사원들은 실시간으로 조회 가능(개인 채팅방 생성 시) </em>
    </ul>
  </div>
</details>

<details>
  <summary><b>기능 5. 사원 조회 및 채팅방 조회 기능</b></summary>
  <br>
  <div markdown="1">
    <ul>
      <table border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="50%">
            <img src="https://github.com/user-attachments/assets/892fe518-4341-4db2-a868-0b38d13b1652" width="100%">
          </td>
          <td width="50%">
            <img src="https://github.com/user-attachments/assets/76f2d9f5-ab60-4600-bbd5-f0d4985586af" width="100%">
          </td>
        </tr>
      </table>
      <em> 검색한 글자(2글자 이상)가 포함되는 사원 전체 출력 및 채팅방 조회 </em>
    </ul>
  </div>
</details>

<details>
  <summary><b>기능 6. SSE(Server Sent Event)를 활용한 알림 기능</b></summary>
  <br>
  <div markdown="1">
    <ul>
      <img src="https://github.com/user-attachments/assets/8c998b73-24e3-47be-8bdc-5fb2b30bcf13"/>
      <img src="https://github.com/user-attachments/assets/1d348033-190e-44f5-8a95-d56f73da4fc7"/>
      <em> 읽지 않은 채팅 내용에 대하여 알림을 보내주며 해당 글을 읽었을 때 알림창 숫자(1 → 0)가 변하는 모습 </em>
    </ul>
  </div>
</details>

<br>

### (2) 전자결재 조회 기능
<details>
  <summary><b>File 구조</b></summary>
  <br>
  <div markdown="1">
    <ul>
      <img src="https://github.com/user-attachments/assets/f0ad1bc8-1427-487c-b1fd-a6c387cc0775"/>
    </ul>
  </div>
</details>
<details>
  <summary><b>기능 1. 전체 전자 결재 문서 조회 기능</b></summary>
  <br>
  <div markdown="1">
    <ul>
      <img src="https://github.com/user-attachments/assets/7d6e20e6-3955-4883-89f1-2106456518e9"/>
      <em> 로그인한 사원이 볼 수 있는 전체 전자 결재 문서 조회 기능 </em>
    </ul>
  </div>
</details>

<details>
  <summary><b>기능 2. 전자 결재 별 상세 보기 기능</b></summary>
  <br>
  <div markdown="1">
    <ul>
      <img src="https://github.com/user-attachments/assets/464a4034-a1ba-4c55-b12e-554d31d61994"/>
      <em> 사원이 볼 수 있는 전체의 문서를 클릭 시 해당 상세보기 창으로 이동 </em>
    </ul>
  </div>
</details>

<details>
  <summary><b>기능 3. 그 외 내가 기안한 문서, (수신, 참조, 내가 받지는 않았으나 볼 수 있는 문서, 임시 저장한) 문서 조회</b></summary>
  <br>
  <div markdown="1">
    <ul>
    <img src="https://github.com/user-attachments/assets/ff028961-c615-4330-a0d0-f321418c73be"/>
      <em> 추가적으로 클릭 시 기능 2의 문서 상세보기 창으로 이동하여 상세 정보를 확인할 수 있음 </em>
    </ul>
  </div>
</details>
<br>


## 📚 배운 점
### 해당 프로젝트에서 무엇을 배웠는가 ?
<ul align="justify">
  <li>
    <b>다중 테이블 JOIN으로 인한 성능 저하</b> <br>
    <ul>
      <li>
        Oracle 옵티마이저를 통해 기존의 문제점(Table Full Scan 방식)을 확인
      </li>
      <li>
        Foreign key로 사용되고 있는 ID 컬럼에 Index 전략을 수립하여 Index Scan 방식으로 변화하여 기존 실행시간 대비 85% 줄어든 실행 시간을 기록
      </li>
      <li>
        관련된 Velog 글 : 🔗<a href="https://velog.io/@lunia1109/TIL-24.08.01">트러블슈팅 기록 링크</a>
      </li>
    </ul>
  </li>
  <br>
  <li>
    <b>알림기능 구현을 위한 SSE 기반 단방향 통신 구현</b> <br>
    <ul>
      <li>
        HTTP / HTTPS와 높은 호환성과 단순한 구현 방식으로 인해 해당 프로젝트에서 WebSocket 방식보다는 더욱 적합하다고 판단 후 도입
      </li>
      <li>
        관련된 Velog 글 : 🔗<a href="https://velog.io/@lunia1109/TIL-24.07.21">트러블슈팅 기록 링크</a>
      </li>
    </ul>
  </li>
  <br>
  <li>
    <b>능동적으로 학습하여 구현할 수 있다는 사실</b> <br>
    <ul>
      <li>
        국비지원 수업 과정 중 다루지 않았던 Server Sent Event(SSE)에 대하여 스스로 찾아보고 WebSocket과의 차이점을 공부하며 어떠한 경우에 SSE를 사용하는 것이 바람직하며 이로 인한 이점은 무엇이 있는지 찾아보고 난 후 Business Logic을 구현하였습니다.
      </li>
      <li>
        관련된 Velog 글 : 🔗<a href="https://velog.io/@lunia1109/TIL-24.07.21">운영 중인 Velog</a>
      </li>
    </ul>
  </li>
  <br>
</ul>
