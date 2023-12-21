// SPDX-License-Identifier: MIT

pragma solidity >=0.8.2 <0.9.0;

contract Basic2 {
    // 전역변수 : 체인 전체
    // 상태변수 : contract 안 전체
    // 지역변수 : 해당 함수 안에서만

    // 지역변수만 사용 할 경우, (상태변수를 참고/읽지 않을 경우) pure 사용. view보다 가스비가 저렴함.
    function add(uint _a, uint _b) public pure returns(uint) {
        return _a + _b;
    }

    function mul(uint _a, uint _b) public pure returns(uint) {
        return _a * _b;
    }

    // 에러발생함.
    function sub(uint _a, uint _b) public pure returns(uint) {
        return _a - _b;
    }

    /* uint = unsigned integer 0 ~ 2^256 -1
        int = signed integer
    음수를 표현하려면 int 사용하면 됨.*/
    function sub2(int _a, int _b) public pure returns(int) {
        return _a - _b;
    }

    // 10, 3 값을 주면 3이 출력됨. 즉, 몫만 나옴.
    function div(uint _a, uint _b) public pure returns(uint) {
        return _a / _b;
    }

    // 나머지 값을 구하려면?
    function div2(uint _a, uint _b) public pure returns(uint) {
        return _a % _b;
    }
}