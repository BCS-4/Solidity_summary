# Event

- environment set

  > 환경준비.txt

- eventemit 실습

  > eventemit.txt

# event filter

- event.sol/indexed_event deploy

  ```javascript
    contract indexed_event {
      event index_1(uint indexed _num, string _name); // uint indexed

      function event_1(uint _n, string memory _s) public {
        emit index_1(_n, _s);
      }
    }
  ```

  > 배포 후 Contract Address / ABI 준비

- 실습 (event.sol/indexed_event)

  > var {Web3} = require('web3')  
  > var web3 = new Web3('wss://sepolia.infura.io/ws/v3/apiKey')  
  > var c_addr = "contract address"  
  > var abi = abi 붙여넣기  
  > var contract = new web3.eth.Contract(abi, c_addr)  
  > contract.events 확인  
  > 10일 경우 받기
  >
  > > contract.events.index_1({filter:{\_num:10}}).on('data',function(event){console.log(event)})

  > 200, 300일 경우만 받기
  >
  > > contract.events.index_1({filter:{\_num:[200,300]}}).on('data',function(event){console.log(event)})

- event.sol/indexed_event2 deploy

  ```javascript
    contract indexed_event2 {
      event index_1(uint _num, string indexed _name); // string indexed

      function event_1(uint _n, string memory _s) public {
        emit index_1(_n, _s);
      }
    }
  ```

  > 배포 후 Contract Address / ABI 준비

- 실습 (event.sol/indexed_event2) ※ 실습 1에 이어서

  > var c_addr2 = "contract address"  
  > var abi2 = abi 붙여넣기  
  > var contract2 = new web3.eth.Contract(abi2, c_addr2)  
  > contract2.events 확인

  > abc 일 경우만 받기
  >
  > > contract2.events.index_1({filter:{\_name: "abc"}}).on('data',function(event){console.log(event)})

- event.sol/indexed_event3 deploy

  ```javascript
    contract indexed_event3 {
      event index_1(uint indexed _num, string indexed _name);

      function event_1(uint _n, string memory _s) public {
        emit index_1(_n, _s);
      }
    }
  ```

- 실습 (event.sol/indexed_event3) ※ 실습 2에 이어서

  > var c_addr3 = "contract address"  
  > var abi3 = abi 붙여넣기  
  > var contract3 = new web3.eth.Contract(abi2, c_addr2)  
  > contract3.events 확인

  > 12345 / abcde 일 경우만 받기
  >
  > > contract3.events.index_1({filter:{\_num:12345, \_name:'abcde'}}).on('data',function(event){console.log(event)})
  > >
  > > > 12345 / abcde 경우 읽음.  
  > > > 12345 / abc 일 경우도 event 읽음 (둘 중 하나면 가능)  
  > > > 123 / abc 일 경우 못 읽음 (둘 다 다를 경우)
