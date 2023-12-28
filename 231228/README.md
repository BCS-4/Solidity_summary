## 시험 4 (12/28 까지 클래스매니저에게 DM으로 제출)

```javascript
  자동차를 운전하려고 합니다.
  자동차의 상태에는 정지, 운전중, 시동 끔, 연료없음 총 4가지 상태가 있습니다.

  정지는 속도가 0인 상태, 운전 중은 속도가 있는 상태이다.

  * 악셀 기능 - 속도를 1 올리는 기능, 악셀 기능을 이용할 때마다 연료가 2씩 줄어듬, 연료가 30이하면 더 이상 악셀을 이용할 수 없음, 70이상이면 악셀 기능은 더이상 못씀
  * 브레이크 기능 - 속도를 1 줄이는 기능, 브레이크 기능을 이용할 때마다 연료가 1씩 줄어듬, 속도가 0이면 브레이크는 더이상 못씀
  * 시동 끄기 기능 - 시동을 끄는 기능, 속도가 0이 아니면 시동은 꺼질 수 없음
  * 시동 켜기 기능 - 시동을 켜는 기능, 시동을 키면 정지 상태로 설정됨
  * 주유 기능 - 주유하는 기능, 주유를 하면 1eth를 지불해야하고 연료는 100이 됨

  지불은 smart contract에게 함.
  ----------------------------------------------------------------------------------------
  * 주유소 사장님은 2번 지갑의 소유자임(2번 지갑 주소 하드코딩(복붙) 하면 됨), 주유소 사장님이 withdraw하는 기능
  * 지불을 미리 하고 주유시 차감하는 기능
```

## 복습

- address_payable.sol

  > 자료형 address.  
  > msg.sender : 함수를 실행 한 지갑주소.  
  > payable : 아래 예시에서는 b상태변수도 payable이기 때문에, setB()함수에 상태변수를 변경 할 때 payable로 감싸줘야 함.

  ```javascript
    contract ADDRESS_Payable {
      address a;
      address payable b;

      function setA() public {
          a = msg.sender;
      }

      function setB() public {
          b = payable(msg.sender);
      }

      function deposit() public payable returns(uint) {
          return msg.value;
      }

      function sendToB() public {
          b.transfer(0.1 ether);
      }

      function getAB() public view returns(address, address) {
          return (a, b);
      }
    }
  ```

  > 하지만 getAB()함수에서 return에는 payable을 작성하지 않아도 됨.  
  > a.transfer(0.1 ether); 는 불가능함. a가 payable이 아니기 때문!  
  > sendoB() 함수는 contract에서 b한테 돈을 보내는 것임.  
  > function에 payable이 붙어야지 내 지갑에서 돈이 나가고 contract에 돈을 보내는 것임.  
  > deposit 함수를 실행하려면 msg.value 즉, 금액을 입력해야 함.

  ```javascript
    contract ADDRESS_This_Balance {
      address a;

      function deposit() public payable {}

      function setA() public {
          a = msg.sender;
      }

      function getBalance() public view returns(uint) {
          return a.balance;
      }

      function getBalance2() public view returns(uint) {
          return address(this).balance;
      }

      function getAddress_This() public view returns(address) {
          return address(this);
      }
    }
  ```

  > this는 컨트랙트 주소임.

  ```javascript
    contract ADDRESS_CONSTRUCTOR {
      address payable owner;

      constructor() {
          owner = payable(msg.sender);
      }

      function deposit() public payable {}

      function getOwner() public view returns(address) {
          return owner;
      }

      function withdraw_1() public {
          owner.transfer(1 ether);
      }

      function withdraw_all() public {
          owner.transfer(address(this).balance);
      }
    }
  ```

  > constructor를 사용해서 배포한 사람을 owner로 설정.  
  > withdraw_all은 address(this) = 컨트랙트의 잔고를 owner에게 보내는 것임.

  - 재원님 요약(거래소 거래)

  > 거래소  
  > 거래소 지갑주소 입출금 거래만 체인에 등록  
  > 거래소 내 거래는 유동성 기반으로 central DB에서 숫자만 왔다갔다 하는 것(체인과 무관, 사이트 닫아버리면 다 끝나는 것)

  > 거래  
  > 비트코인 : UTXO 기반으로 locking-unlocking. 여기엔 스마트 컨트랙트가 존재하지 않음.  
  > 비트코인은 EVM이 없으니까 코어레벨에서 돈 보내는 것 밖에 안 됨

  > 이더리움 : ACCOUNT 기반으로 메타마스크 지갑끼리 돈을 보내면 이더리움 코어레벨에서 이뤄지는 거고 체인에 기록됨. > bitcoin이 이동하는 것과 원리가 같음. ERC-20은 전부 다 스마트컨트랙트.

  > 이더리움은 EVM으로 복잡한 거래 기능 구현 가능  
  > EVM Level - solidity  
  > Core Level - PoS, tx, Block

- goerli testnet

  > testnet 배포해보기.  
  > 이더리움에서 nonce값은 '특정 지갑이 몇 번 거래를 일으켰는가'임. 항상 1씩 증가함.  
  > nonce를 추적하는 이유 : 이중지불문제 때문임.

- modifier.sol

  > modifier 사용해보기.  
  > 1개의 함수에 modifier 2개사용해보기. (순서중요)

## 이더리움 관련 링크

> https://ethresear.ch/  
> https://ethereum.org/en/learn/  
> https://github.com/ethereum/research  
> https://vitalik.eth.limo/  
> https://blog.ethereum.org/  
> wrapping : https://arxiv.org/ftp/arxiv/papers/2109/2109.06847.pdf
