// SPDX-License-Identifier: MIt
pragma solidity >=0.8.2 <0.9.0;

contract BYTES {
    // bytes 형 변수 a 를 선언하세요.
    bytes a;

    // 길이의 제한이 있는 bytes를 선언해보자.
    bytes1 b;  // 16진수 2자리
    bytes2 c;  // 16진수 4자리
    bytes32 d;  // 16진수 64자리

    // bytes1, bytes2 등 자리수가 정해져 있는 건 memory가 필요없음.
    function setABCD(bytes memory _a, bytes1 _b, bytes2 _c, bytes32 _d) public {
        a = _a;
        b = _b;
        c = _c;
        d = _d;
    }
    /* setABCD() 인풋으로 아래 값을 넣어보자.
        _a = 0x1234
        _b = 0x12
        _c = 0x1234
        _d = 0x1234123412341234123412341234123412341234123412341234123412341234

        만약 _a 값에 1234 또는 "1234"를 넣으면 안됨. 그런데 아래 setA() 함수는 실행 됨.
        아스키코드로 변경됨.
    */
    
    function setA() public {
        a = "1234";
    }

    function getABCD() public view returns(bytes memory, bytes1, bytes2, bytes32) {
        return (a, b, c, d);
    }
}