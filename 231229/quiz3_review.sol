/*
    여러분은 검색 엔진 사이트에서 근무하고 있습니다. 고객들의 ID와 비밀번호를 안전하게 관리할 의무가 있습니다.
    따라서 비밀번호를 rawdata(있는 그대로) 형태로 관리하면 안됩니다.
    비밀번호를 안전하게 관리하고 로그인을 정확하게 할 수 있는 기능을 구현하세요.

    아이디와 비밀번호는 서로 쌍으로 관리됩니다.
    비밀번호는 rawdata가 아닌 암호화 데이터로 관리되어야 합니다.
    (string => bytes32)인 mapping으로 관리

    value인 bytes32는 ID와 PW를 같이 넣은 후 나온 결과값으로 설정하기
    abi.encodePacked() 사용하기

    * 로그인 기능 - ID, PW를 넣으면 로그인 여부를 알려주는 기능
    * 회원가입 기능 - 새롭게 회원가입할 수 있는 기능
    ---------------------------------------------------------------------------
    * 회원가입시 이미 존재한 아이디 체크 여부 기능 - 이미 있는 아이디라면 회원가입 중지
    * 비밀번호 5회 이상 오류시 경고 메세지 기능 - 비밀번호 시도 회수가 5회되면 경고 메세지 반환
    * 회원탈퇴 기능 - 회원이 자신의 ID와 PW를 넣고 회원탈퇴 기능을 실행하면 관련 정보 삭제
*/

// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.15;

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

contract GetDefault {
    // 1bytes = 2자리
    bytes32 a;  // default : 0x0000000000000000000000000000000000000000000000000000000000000000 (64자리)
    bytes1 b;   // dafault : 0x00
    bytes2 c;   // default : 0x0000

    function getA() public view returns(bytes32) {
        return a;
    }

    function getDefault() public pure returns(bytes32) {
        return bytes32(0);
    }

    function getBC() public view returns(bytes1, bytes2) {
        return (b, c);
    }
}