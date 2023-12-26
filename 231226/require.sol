// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.15;

contract REQUIRE {
    uint a;
    function require_1(uint _n) public returns(string memory) {
        a = _n;
        if(a>=0 && a<=2) {
            return "A";
        } else if(a>=3 && a<=5) {
            return "B";
        } else if(a>=6 && a<=8) {
            return "C";
        } else if(a==9 || a==10) {
            return "D";
        } else {
            return "F";
        }
    }

    // require_1 함수는 _n = 11로 실행하면 실행은 되고 F가 출력됨.
    // 아래 require_1_2 함수에 _n=11로 실행하면 revert.
    function require_1_2(uint _n) public returns(string memory) {
        require(_n<=10, "_n should not be higher than 10.");
        a = _n;
        if(a>=0 && a<=2) {
            return "A";
        } else if(a>=3 && a<=5) {
            return "B";
        } else if(a>=6 && a<=8) {
            return "C";
        } else {
            return "D";
        }
    }

    // require_1_3 함수에 _n = 11 값을 넣으면, 똑같이 revert됨.
    // 단, a = _n은 적용되고 revert가 아닌, 함수 실행 전(초기상태)으로 복귀.
    // require는 순서 상관없음. 함수 실행시 가스비가 소량 소모되긴하나 나머지는 refund. 
    function require_1_3(uint _n) public returns(string memory) {
        a = _n;
        require(_n<=10, "_n should not be higher than 10.");
        if(a>=0 && a<=2) {
            return "A";
        } else if(a>=3 && a<=5) {
            return "B";
        } else if(a>=6 && a<=8) {
            return "C";
        } else {
            return "D";
        }
    }

    function getA() public view returns(uint) {
        return a;
    }
}