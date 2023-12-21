// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.15;

contract Basic {
    // uint a, b, c는 전역변수임. 즉, 여러 군대에서 상태변경이 가능함.
    uint a; // 숫자형 변수 a
    uint b; // 숫자형 변수 b
    uint c = 2; // 숫자형 변수 c

    // _a는 지역변수임. setA()함수 밖을 벗어날 수 없음.
    // 즉, setA(), setAB()에서 _a 는 여러번 사용 될 수 있음.
    function setA(uint _a) public {
        a = _a;
    }

    function setB(uint _b) public {
        b = _b;
    }

    function setC(uint _c) public {
        c = _c;
    }
    
    function setAB(uint _a, uint _b) public {
        a = _a;
        b = _b;
    }
    

    function setAsNine() public {
        a = 9;
    }

    function getA() public view returns(uint) {
        return a;
    }

    function getB() public view returns(uint) {
        return b;
    }

    function getC() public view returns(uint) {
        return c;
    }

    function getAB() public view returns(uint, uint) {
        return (a, b);
    }

}