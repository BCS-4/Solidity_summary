// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract REVIEW {
    // 숫자형 상태변수 a를 선언하세요.
    uint a;

    // 상태변수 a와 input 값 _a을 더하고 반환하는 함수를 만드세요.
    function add2(uint _a) public view returns(uint) {
        return a + _a;
    }

    // 상태변수 a를 변경하는 함수를 만드세요.
    function setA(uint _a) public {
        a = _a;
    }

    // 지역변수 _a 와 _b를 더하고 반환하는 함수를 만드세요.
    function add(uint _a, uint _b) public pure returns(uint) {
        return _a + _b;
    }

    // 상태변수 a의 _b 제곱을 반환하는 함수를 만드세요.
    function powerB(uint _b) public view returns(uint) {
        return a ** _b;
    }

    // 두 개의 숫자를 곱하고 반환하는 함수를 만드세요.
    function mul(uint _a, uint _b) public pure returns(uint) {
        return _a * _b;
    }
}