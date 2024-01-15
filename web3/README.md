### web3js

## https://web3js.readthedocs.io/en/v1.10.0/

- cmd 기본 명령어

  > 폴더 이동 : cd  
  > 현재 위치에서의 파일/폴더 리스트 : ls  
  > 현재위치 경로 : pwd  
  > mkdir 폴더명 : 폴더 생성  
  > 커맨드 창 클리어 : clear

- 실습하기 (setting)

  > cmd로 실습하기. (window powershell로 작성 됨)

  > web3 폴더 생성 후 폴더로 이동하기 : mkdir web3  
  > npm init  
  > npm install web3

  > node (노드 열기)

  ```javascript
  var { Web3 } = require("web3");

  // provider 설정
  var web3 = new Web3("https://cloudflare-eth.com");
  ```

  > 아래 2개 명령어로 web3에 뭐가 있는지 / provider는 어떻게 설정되어 있는지 확인하기.

  > > web3  
  > > web3.provier

  > 최근 블록 불러오기

  ```javascript
  await web3.eth.getBlockNumber().then(console.log);
  ```

  > 특정 블록 불러오기

  ```javascript
  await web3.eth.getBlock(블록넘버).then(console.log);
  ```

  > Balance 가져오기

  ```javascript
  web3.eth.getBalance("지갑주소").then(console.log);
  ```

  > 거래 정보 확인

  ```javascript
  await web3.eth.getTransaction("Tx hash").then(console.log);
  ```

  > n번블록의 a번째 거래를 가져오기. (12345678 블록의, 2번째 거래 정보)

  ```javascript
  await web3.eth.getTransactionFromBlock(12345678, 1).then(console.log);
  ```

  > 계정 관련 정보

  ```javascript
  await web3.eth.accounts;
  ```

  > 계정 생성

  ```javascript
  web3.eth.accounts.create();
  ```

  > 개인키에 따른 계정 확인

  ```javascript
  web3.eth.accounts.privateKeyToAccount("개인키");
  ```

  > 특정 계정의 개인키로 잔액 받아오기

  ```javascript
  async function getBalances() {
    var a = web3.eth.accounts.privateKeyToAccount("개인키");
    var balance = await web3.eth.getBalance(a.address);
    console.log(balance);
  }
  ```
