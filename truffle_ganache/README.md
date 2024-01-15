# Truffle & Ganache

## truffle

- 설치하기 (cmd로 작업해보기)

  ```javascript
    npm install -g truffle  // 설치
    truffle version  // 버전 확인
    truffle  // truffle 명령어 확인
  ```

- 실습하기

  > start 폴더 생성하기

  ```javascript
    mkdir start  // start 폴더 생성
    cd start  // start 폴더로 이동
    truffle init
  ```

  > truffle init을 하면 ls로 생성 된 목록들 확인해보기(contracts 폴더는 비어있음).  
  > ※ 버전에 따라 폴더안에 migration.sol이 있을 수 있음.

- A.sol 생성하기

  ```javascript
    truffle create contract A
  ```

  > contracts 폴더 안에 A.sol이 생성 됨.  
  > 컨트랙트 내용 보기 (cat A.sol)

- VS Code로 A.sol 열어서 아래 코드 작성하기

  ```javascript
    // SPDX-License-Identifier: MIT
    pragma solidity >=0.4.22 <0.9.0;

    contract A {
      function add(uint \_a, uint \_b) public pure returns(uint) {
        return \_a + \_b;
      }
    }
  ```

- 컴파일 하기

  ```javascript
    truffle compile
  ```

  > 컴파일이 정상적으로 완료 되었으면, start/build/contracts 에 a.json 파일 생성됨.

- 배포하기 (migrate)
  > truffle-config.js에서 networks 확인해야 함.  
  > development 부분 주석 해제.(67~71번 줄)  
  > compilers: solc: version 컴파일러 버전확인. 0.8.19로 (107~119번 줄)
  ```javascript
    truffle migrate
  ```

## ganache

- 설치하기

  > https://trufflesuite.com/ganache

  ```javascript
    npm install -g ganache-cli
  ```

  > ganache-cli 로 확인  
  > ※ 에러가 발생하면 ganache 포트번호랑 겹치는지 확인.  
  > truffle config.js 의 포트를 8545로 변경  
  > truffle migrate 후에 터미널에 결과 확인.  
  > cli가 바라보는 포트랑 가나슈 포트 체크.  
  > 1개의 솔리디티 파일에 컨트랙트가 2개 이상이면, complie / migrate해도 1개만 됨. 따라서, 나머지는 가나슈에서 add project -> save & restart 하면 됨.

- 함수 사용하기 (A.sol 파일)
  > truffle console
  ```javascript
  let abc = await ABC.deploayed();
  // ABC는 컨트랙트 이름 => abc로 변수화 시킨 것. await 필수임.
  ```
  > ABC 컨트랙트에 있는 add 함수를 사용해보자.
  ```javascript
  abc.add(1, 2); // 결과 값 : 3
  ```
  > 다른 컨트랙트도 만들어서 실습해보기

## 테스트넷에 배포하기

- 기본 셋팅

  ```javascript
    mkdir goerli  // goerli 폴더 생성
    cd goerli  // goerli 폴더로 이동
    truffle init
    npm install dotenv  // dotenv 설치
    npm i @truffle/hdwallet-provider@next
  ```

- ABC.sol 파일 생성

  ```javascript
    // 명령어로 생성하려면 아래 명령어 사용
    truffle create contract ABC

    notepad ABC.sol  // 메모장으로 열어서 수정 가능함.
  ```

  ```javascript
    // SPDX-License-Identifier: MIT
    pragma solidity >=0.4.22 <0.9.0;

    contract ABC {
      uint public A;

      function setA(uint _a) public {
          A = _a;
      }

      function getA() public view returns(uint) {
          return A;
      }

      function cal(uint _a, uint _b) public pure returns(uint, uint) {
          return (_a+_b, _a*_b);
      }
    }
  ```

- infura api key / 니모닉코드(복구구문) 준비하기

- migrations 폴더에 1_ABC.js 파일 생성

  ```javascript
  const abc = artifacts.require("ABC");

  module.exports = function (deployer) {
    deployer.deploy(abc);
  };
  ```

  > migrations의 파일은 1\_\파일명.js, 2\_\파일명.js ... 의 규칙으로 생성해야 함.

- compile

  ```javascript
    truffle compile
  ```

  > 컴파일하면 build/contracts 안에 ABC.json 파일이 생성 됨.

- .env 파일 생성

  > truffle-config.js와 같은 계층에 .env파일 생성

  ```javascript
    MNEMONIC = 니모닉코드 입력
    PROJECT_ID = infura api key 입력
  ```

- truffle-config.js 수정

  > 44~47번째 줄 dotenv / provider 관련 코드 주석 해제.  
  > 85~91번째 줄 network>goerli 코드 주석 해제.

- 배포하기

  ```javascript
    truffle compile
    truffle migrate --network goerli
  ```

  > 배포 후 터미널과 goerli etherscan에서 확인하기.  
  > https://goerli.etherscan.io/

- 함수 실행하기

  > ※ truffle console을 사용 할 건데, 로컬이 아니기 때문에 아래 명령어로 실행하기.

  ```javascript
    truffle console --network goerli

    let abc = await ABC.deployed()

    abc.methods  // 함수 확인해보기

    abc.setA(5)  // A를 5로 값 변경해보기
  ```

- web3.js와 같이 사용해보자.

  > 터미널 하나 더 열어서 web3 설치

  ```javascript
    npm install web3
  ```

  ```javascript
  var { Web3 } = require("web3");
  var web3 = new Web3("infura goerli api key넣기");

  await web3.eth.getStorageAt("컨트랙트 주소", "상태변수 슬롯");

  await web3.eth.getStorageAt("컨트랙트 주소", "0");
  // uint public A의 값이 나옴.
  // 0x0000000000000000000000000000000000000000000000000000000000000005
  ```

- ethers.js도 사용해보자.

  > 터미널 하나 더 열어서 ethers 설치

  ```javascript
    npm install ethers
    node  // node 진입
  ```

  ```javascript
  var { ethers } = require("ethers");
  var provider_goerli = new ethers.InfuraProvider((network = "goerli"));

  getStorage("컨트랙트 주소", "상태변수 슬롯");
  await provider_goerli.getStorage("컨트랙트 주소", "0");
  ```

## constructor가 있는 컨트랙트 truffle / ganache로 배포하기

- constructor가 1개 일 때

  ```javascript
    // Constructor.sol
    // SPDX-License-Identifier: MIT
    pragma solidity ^0.8.19;

    contract Constructor1 {
      uint public a;

      constructor(uint _a) {
        a = _a;
      }
    }
  ```

  ```javascript
  // 1_Constructor.js
  const constructor1 = artifacts.require("Constructor1");
  module.exports = function (deployer) {
    deployer.deploy(constructor1, 3); // constructor 값 3을 넣은 것임.
  };

  // ganache에서 확인해보면 값이 설정되어 있음. a = 3
  ```

- (이어서)constructor 인풋 값이 2개 일 때

  ```javascript
    // Constructor.sol
    contract Constructor2{
      uint public a;
      uint public b;

      constructor(uint _a, uint _b) {
        a = _a;
        b = _b;
      }
    }
  ```

  ```javascript
  // 1_Constructor.js
  const constructor1 = artifacts.require("Constructor1");
  const constructor2 = artifacts.require("Constructor2");

  module.exports = function (deployer) {
    deployer.deploy(constructor1, 3);
    deployer.deploy(constructor2, 3, 4); // constructor 값 a=3, b=4 넣은 것임.
  };
  ```

- (이어서) constructor 인풋 값이 숫자형, 문자형 일 경우

  ```javascript
    // Constructor.sol
    contract Constructor3{
      uint public a;
      string public b;

      constructor(uint _a, string memory _b) {
        a = _a;
        b = _b;
      }
    }
  ```

  ```javascript
  // 1_Constructor.js
  const constructor1 = artifacts.require("Constructor1");
  const constructor2 = artifacts.require("Constructor2");
  const constructor3 = artifacts.require("Constructor3");

  module.exports = function (deployer) {
    deployer.deploy(constructor1, 3);
    deployer.deploy(constructor2, 3, 4);
    deployer.deploy(constructor3, 3, 5, "string");
  };
  ```
