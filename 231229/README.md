### 기초문제 21~50번 꼭 풀어오세요!

## 시험 3 review

```javascript
  contract QUIZ3 {
    mapping(string => bytes32) ID_PW;
    mapping(string => uint) Trial;

    function getHash(string memory _ID, string memory _PW) public pure returns(bytes32) {
        return keccak256(abi.encodePacked(_ID, _PW));
    }

    function getTrial(string memory _ID) public view returns(uint) {
        return Trial[_ID];
    }

    // * 회원가입 기능 - 새롭게 회원가입할 수 있는 기능
    function signIn(string memory _ID, string memory _PW) public {
        // * 회원가입시 이미 존재한 아이디 체크 여부 기능 - 이미 있는 아이디라면 회원가입 중지
        require(ID_PW[_ID] == bytes32(0), "go back");
        ID_PW[_ID] = getHash(_ID, _PW);
    }

    // * 로그인 기능 - ID, PW를 넣으면 로그인 여부를 알려주는 기능
    function logIn(string memory _ID, string memory _PW) public returns(bool){
        // * 비밀번호 5회 이상 오류시 경고 메세지 기능 - 비밀번호 시도 회수가 5회되면 경고 메세지 반환
        require(ID_PW[_ID] != bytes32(0) && Trial[_ID] < 5, "ask for new password");
        if(ID_PW[_ID]==getHash(_ID, _PW)) {
            Trial[_ID] = 0;
            return true;
        } else {
            Trial[_ID] ++;
            return false;
        }
    }

    // * 회원탈퇴 기능 - 회원이 자신의 ID와 PW를 넣고 회원탈퇴 기능을 실행하면 관련 정보 삭제
    function signOff(string memory _ID, string memory _PW) public {
        require(ID_PW[_ID]==getHash(_ID, _PW), "go back");
        delete ID_PW[_ID];
    }
}

contract QUIZ3_v2 {
    struct User {
        bytes32 hash;
        uint attempts;
        bool isLogin;
        address addr;
    }
    mapping(string => User) userInfo;

    function getHash(string memory _ID, string memory _PW) public pure returns(bytes32) {
        return keccak256(abi.encodePacked(_ID, _PW));
    }

    // * 회원가입 기능 - 새롭게 회원가입할 수 있는 기능
    function signIn(string memory _ID, string memory _PW) public {
        // * 회원가입시 이미 존재한 아이디 체크 여부 기능 - 이미 있는 아이디라면 회원가입 중지
        require(userInfo[_ID].hash == bytes32(0), "go back");
        userInfo[_ID].hash = getHash(_ID, _PW);
        userInfo[_ID].addr = msg.sender;
    }
    // * 로그인 기능 - ID, PW를 넣으면 로그인 여부를 알려주는 기능
    function logIn(string memory _ID, string memory _PW) public returns(bool){
        // * 비밀번호 5회 이상 오류시 경고 메세지 기능 - 비밀번호 시도 회수가 5회되면 경고 메세지 반환
        require(userInfo[_ID].addr == msg.sender && userInfo[_ID].isLogin == false && userInfo[_ID].attempts < 5, "ask for new password");
        if(userInfo[_ID].hash==getHash(_ID, _PW)) {
            userInfo[_ID].attempts = 0;
            userInfo[_ID].isLogin = true;
            return true;
        } else {
            userInfo[_ID].attempts ++;
            return false;
        }
    }

    function logOut(string memory _ID) public {
        require(userInfo[_ID].addr == msg.sender && userInfo[_ID].isLogin==true, "go back");
        userInfo[_ID].isLogin = false;
    }

    // * 회원탈퇴 기능 - 회원이 자신의 ID와 PW를 넣고 회원탈퇴 기능을 실행하면 관련 정보 삭제
    function signOff(string memory _ID, string memory _PW) public {
        require(userInfo[_ID].addr == msg.sender && userInfo[_ID].isLogin == true && userInfo[_ID].hash==getHash(_ID, _PW), "go back");
        delete userInfo[_ID];
    }
  }
```

## 복습

- 기본문제 1~30번 풀기!

- modifier.sol

  > modifier 순서에 따라 어떻게 작동하는지

- block.sol

  > unix time  
  > 예약어(seconds, minutes, hours, days, weeks)  
  > block.number  
  > blockhash

- global_variables.sol

  > 다양한 전역변수 공부해보기!

- returns.sol

  > returns 갯수가 다를 때, 원하는 returns 값만 가져오기.

# DEX를 공부하고 싶다면?

> uniswap, makerdao, aave, curve, dai, sushiswap
