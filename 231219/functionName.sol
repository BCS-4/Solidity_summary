// SPDX-License-Identifier: MIT

pragma solidity >=0.8.2 <0.9.0;

contract Function_Name {
    /* 함수를 구분하는 기준
     1. 이름
     2. input 값의 상황 / input값의 갯수, 자료형이 달라도 다른걸로 인식
     ※ 지역변수는 인식하지 못함.
    */

    uint a;
    uint b;
    uint c;

    function add(uint _a, uint _b) public pure returns(uint) {
        return _a + _b;
    }

    function add(uint _a, uint _b, uint _c) public returns(uint) {
        return _a + _b + _c;
    }

    function add(uint _a, string memory _b) public pure returns(string memory) {
        return _b;
    }

    function add() public view returns(uint) {
        return a + b;
    }
}