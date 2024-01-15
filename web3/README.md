# web3js

- https://web3js.readthedocs.io/en/v1.10.0/

- cmd 기본 명령어

  > 폴더 이동 : cd  
  > 현재 위치에서의 파일/폴더 리스트 : ls  
  > 현재위치 경로 : pwd  
  > mkdir 폴더명 : 폴더 생성  
  > 커맨드 창 클리어 : clear

## 실습하기 (setting)

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

- 아래 2개 명령어로 web3에 뭐가 있는지 / provider는 어떻게 설정되어 있는지 확인하기.

> web3  
> web3.provier

- 최근 블록 불러오기

```javascript
await web3.eth.getBlockNumber().then(console.log);
```

- 특정 블록 불러오기

```javascript
await web3.eth.getBlock(블록넘버).then(console.log);
```

- Balance 가져오기

```javascript
web3.eth.getBalance("지갑주소").then(console.log);
```

- 거래 정보 확인

```javascript
await web3.eth.getTransaction("Tx hash").then(console.log);
```

- n번블록의 a번째 거래를 가져오기. (12345678 블록의, 2번째 거래 정보)

```javascript
await web3.eth.getTransactionFromBlock(12345678, 1).then(console.log);
```

- 계정 관련 정보

```javascript
await web3.eth.accounts;
```

- 계정 생성

```javascript
web3.eth.accounts.create();
```

- 개인키에 따른 계정 확인

```javascript
web3.eth.accounts.privateKeyToAccount("개인키");
```

- 특정 계정의 개인키로 잔액 받아오기

```javascript
async function getBalances() {
  var a = web3.eth.accounts.privateKeyToAccount("개인키");
  var balance = await web3.eth.getBalance(a.address);
  console.log(balance);
}
```

## Goerli testnet

- infura에서 키 발급받기. https://www.infura.io/

- provider 설정하기

```javascript
var { Web3 } = require("web3");
var web3 = new Web3("https://goerli.infura.io/v3/개인키");
```

- goerli 최근 블록 번호 가져오기

```javascript
await web3.eth.getBlockNumber();
```

- 본인 지갑 개인키 가져와보기

```javascript
// 개인키는 0x붙여줘야 함. 16진수니까!
var privateKey = "0x개인키";
```

- 가져온 개인키로 account 지정(서명까지 포함되어 있음)

```javascript
const account = web3.eth.accounts.privateKeyToAccount(privateKey);
```

- 2번 지갑 설정하기

```javascript
var account2 = "2번지갑 주소";
```

- 사용 할 지갑 설정

```javascript
web3.eth.accounts.wallet.add(account);
// 여러개 등록 가능하고 조회는 web3.eth.accounts.wallet으로 조회하면 됨. 배열 형식으로 리턴
```

- 거래하기

```javascript
web3.eth
  .sendTransaction({
    from: account.address,
    to: account2,
    gas: "21000",
    value: "1000000000000000",
  })
  .then(console.log);

// gas = gasLimit 21000은 basic transaction fee임.
```

- 거래하기2 (defaulAccount를 정해주면 from을 사용하지 않아도 됨!)

```javascript
web3.eth.defaultAccount = account.address;
web3.eth
  .sendTransaction({ to: account2, gas: "21000", value: "1000000000000000" })
  .then(console.log);
```

## contract 불러오기

- remix에서 테스트넷 배포하기

  ```javascript
    // SPDX-License-Identifier: MIT
    pragma solidity ^0.8.18;

    // a,b,c(변수는 public 하게)를 각각 1,2,3으로 설정하고 이 변수들을 바꿀 수 있는 함수도 같이 구현

    contract A {
      uint public a = 1;
      uint public b = 2;
      uint public c = 3;

      function setA(uint _a) public {
        a = _a;
      }

      function setB(uint _b) public {
        b = _b;
      }

      function setC(uint _c) public {
        c = _c;
      }
    }
  ```

- 터미널에서 명령어 입력하기

  ```javascript
  await web3.eth.getCode("컨트랙트주소");
  ```

- 배포 후 complie 창에서 bytescode 복사와 터미널에 나온 값의 bytescode 일치하는지 확인

- 함수 확인해보기
  ```javascript
  await web3.eth.getStorageAt("컨트랙트주소", "인덱스");
  await web3.eth.getStorageAt(
    "0x594d3bCb155Aabc25080DD5d0Aa7E734CBec5bBe",
    "0"
  );
  // -> 이건 slot 첫 번째 값 가져옴.(a = 1)
  ```

## (이어서) visibility 변경해보자

- visibility 변경

  ```javascript
    // SPDX-License-Identifier: MIT
    pragma solidity ^0.8.18;

    // a,b,c(변수는 public 하게)를 각각 1,2,3으로 설정하고 이 변수들을 바꿀 수 있는 함수도 같이 구현
    contract A {
      uint public a = 1;
      uint private b = 2;
      uint public c = 3;

      function setA(uint _a) public {
        a = _a;
      }

      function setB(uint _b) public {
        b = _b;
      }

      function setC(uint _c) public {
        c = _c;
      }
    }
  ```

- 위 코드 배포 후 getCode / getStorageAt 해보기.
  > 처음에는 0, 1, 2 번 인덱스 잘 나옴.  
  > 그럼 private변수인 b를 100으로 변경해보자. (리믹스에서)  
  > 그리고 다시 1번 인덱스에 다시 접근해보자.  
  > 변경된 0x0000....000064가 나옴.  
  > 즉, private 변수/함수에 접근 할 수 있는 것을 한정하는 것임. 누가 변경시킬 것인가. (접근성O, 가시성X)

## contract 함수 실행하기

- 함수 실행 후 결과 값들 확인

  ```javascript
    // SPDX-License-Identifier: MIT
    pragma solidity ^0.8.18;

    // a,b,c(변수는 public 하게)를 각각 1,2,3으로 설정하고 이 변수들을 바꿀 수 있는 함수도 같이 구현
    contract A {
      uint public a = 1;
      uint public b = 2;
      uint public c = 3;

      function setA(uint _a) public {
        a = _a;
      }

      function setB(uint _b) public {
        b = _b;
      }

      function setC(uint _c) public {
        c = _c;
      }
    }

    contract B {
      uint public a = 1;
      uint private b = 2;
      uint public c = 3;

      function setA(uint _a) public {
        a = _a;
      }

      function setB(uint _b) public {
        b = _b;
      }

      function setC(uint _c) public {
        c = _c;
      }
    }

    contract C {
      struct ABC {
          uint a;
          string b;
          bool c;
      }

      ABC public d = ABC(1, "xyz", true);

      bytes1 public x = 0x12;
      uint internal y = 2;
      string private z = "abcde";

      function setA(bytes1 _x) public {
          x = _x;
      }

      function setB(uint _y) public {
          y = _y;
      }

      function setC(string memory _z) public {
          z = _z;
      }
    }
  ```

- A 컨트랙트

  ```javascript
  await web3.eth.getStorageAt("A컨트랙트 주소", "0");
  // '0x0000000000000000000000000000000000000000000000000000000000000001'

  await web3.eth.getStorageAt("A컨트랙트 주소", "1");
  // '0x0000000000000000000000000000000000000000000000000000000000000002'
  ```

- B 컨트랙트

  ```javascript
  await web3.eth.getStorageAt("B컨트랙트 주소", "0");
  // '0x0000000000000000000000000000000000000000000000000000000000000001'

  await web3.eth.getStorageAt("B컨트랙트 주소", "1");
  // '0x0000000000000000000000000000000000000000000000000000000000000002'

  await web3.eth.getStorageAt("B컨트랙트 주소", "2");
  // '0x0000000000000000000000000000000000000000000000000000000000000003'
  ```

- C 컨트랙트

  ```javascript
  await web3.eth.getStorageAt("C컨트랙트 주소", "0");
  ("0x0000000000000000000000000000000000000000000000000000000000000001"); // ABC public d = ABC(1, "xyz", true); 에서1

  await web3.eth.getStorageAt("C컨트랙트 주소", "1");
  ("0x78797a0000000000000000000000000000000000000000000000000000000006"); // ABC public d = ABC(1, "xyz", true); 에서 xyz
  //※ 즉 끝에 6 값은 자릿수임. 16진수 6자리. 앞에는 아스키코드 값.

  await web3.eth.getStorageAt("C컨트랙트 주소", "2");
  ("0x0000000000000000000000000000000000000000000000000000000000000001"); // ABC public d = ABC(1, "xyz", true); 에서true

  await web3.eth.getStorageAt("C컨트랙트 주소", "3");
  ("0x0000000000000000000000000000000000000000000000000000000000000012"); // bytes1 public x = 0x12;

  await web3.eth.getStorageAt("C컨트랙트 주소", "4");
  ("0x0000000000000000000000000000000000000000000000000000000000000002"); // uint internal y = 2;

  await web3.eth.getStorageAt("C컨트랙트 주소", "5");
  ("0x616263646500000000000000000000000000000000000000000000000000000a"); // string private z = "abcde";
  // 5자리니까 끝에 값이 a임. 16진수 10자리.

  await web3.eth.getStorageAt("C컨트랙트 주소", "6");
  ("0x0000000000000000000000000000000000000000000000000000000000000000"); // 없음(빈슬롯)

  await web3.eth.getStorageAt("C컨트랙트 주소", "7");
  ("0x0000000000000000000000000000000000000000000000000000000000000000"); // 없음(빈슬롯)
  ```

- 즉, bytes와 같이 자리수가 없는 애들은 아스키코드 또는 bytes값이 앞에 나오고, 자릿수가 맨 뒤에 표시됨.
- 하지만, bytes1, bytes2 와 같이 자릿수가 정해진 것은 아스키코드 또는 bytes가 그냥 뒤에 나옴.

## (이어서) contract methodId 확인하기

- 컨트랙트 불러오기 (contract A)

  ```javascript
  var c_address = "컨트랙트 주소";
  var abi = "abi 붙여넣기";

  var contract = new web3.eth.Contract(abi, c_address);
  ```

  > contract.methods 입력하면 아래와 같은 결과 값이 나옴.

  ```javascript
    {
      setA: [Function (anonymous)],
      'setA(uint256)': [Function (anonymous)],
      '0xee919d50': [Function (anonymous)],
      setB: [Function (anonymous)],
      'setB(uint256)': [Function (anonymous)],
      '0x09cdcf9b': [Function (anonymous)],
      setC: [Function (anonymous)],
      'setC(uint256)': [Function (anonymous)],
      '0xeeb4914e': [Function (anonymous)],
      a: [Function (anonymous)],
      'a()': [Function (anonymous)],
      '0x0dbe671f': [Function (anonymous)],
      b: [Function (anonymous)],
      'b()': [Function (anonymous)],
      '0x4df7e3d0': [Function (anonymous)],
      c: [Function (anonymous)],
      'c()': [Function (anonymous)],
      '0xc3da42b8': [Function (anonymous)]
    }
  ```

  > 위 결과 값에서 0x 뒤에 나오는 것이 methodId임.

## (이어서) 상태변수 변경하기

- 상태변수 값 확인하기

  > 리믹스에서 a,b,c 값을 확인해보면 1,2,3 임.  
  > 터미널에서 확인하려면 call()로 확인 할 수 있음.

- tx만들기

  ```javascript
  var tx = {
    from: account.address,
    to: c_address,
    gas: 300000,
    gasPrice: 3000000,
    data: contract.methods.setC(123).encodeABI(),
  };
  ```

- 서명하기

  ```javascript
  var signPromise = web3.eth.accounts.signTransaction(tx, account.privateKey);
  ```

- 서명 보내기

  ```javascript
  signPromise.then((signedTx) => {
    var sentTx = web3.eth.sendSignedTransaction(
      signedTx.raw || signedTx.rawTransaction
    );
    sentTx.on("receipt", (receipt) => {
      console.log(receipt);
    });
  });
  ```

  > call()함수 또는 리믹스에서 확인해보면 값이 123으로 변경되어 있음!

- 위 tx 만들기 / 서명하기 / 서명 보내기 세 과정을 아래처럼 하면 됨.

  ```javascript
  await contract1.methods
    .setC(12345678)
    .send({ from: account.address, gas: 300000, gasPrice: 300000 });
  ```

## 웹소켓

- 지속적으로 event가 발생 할 때 값을 추적하려면 웹소켓을 사용해야 함.

  > 예시로, 새로운 블록이 생성되면 자동으로 값을 불러오고 싶을 경우 사용함.

- 새로운 블록 받아오기

  ```javascript
  var { Web3 } = require("web3");
  var web3 = new Web3("infura ether 메인넷 웹소켓 키 넣기");

  var subscription = await web3.eth.subscribe("newHeads");

  subscription.on("data", async (blockhead) => {
    console.log("New block header: ", blockhead);
  });
  ```
