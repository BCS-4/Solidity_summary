// SPDX-License-Identifier: MIT

pragma solidity >=0.8.2 <0.9.0;

contract Basic4 {
    string a;  // 문자형 변수 a(상태변수). 숫자는 default 값이 0이지만, string은 빈값임.
    uint b;

    /*
    아래 함수는 오류가 발생함. string이 uint보다 조금 더 무거움. 어디에 저장할건지 등 신경써야 함.
    data location이 다름.
    storage : 상태변수들
    memory / calldata : 휘발성 데이터들 
    따라서 string은 memory를 적어줘야 함. memory / calldata는 이후 다룸.

    function setA(string _a) public {
        a = _a;
    }
    */

    function setA(string memory _a) public {
        a = _a;
    }

    function setAasABC() public {
        a = "abc";
    }

    function setAB(string memory _a, uint _b) public {
        a = _a;
        b = _b;
    }

    function getA() public view returns(string memory) {
        return a;
    }

    function getAB() public view returns(string memory, uint) {
        return (a, b);
    }
    /* 아래 코드는 오류임. returns 값, 즉 반환받으려는 값의 순서를 확인해야 함.
    function getAB() public view returns(string memory, uint) {
        return (b, a);
    }
    */

}