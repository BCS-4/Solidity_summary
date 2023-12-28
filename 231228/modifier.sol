// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract MODIFIER {
    uint a;

    // 다양한 곳에서 동일하게 사용되면 modifier 사용 할 수 있음.
    modifier higherThanFive() {
        require(a>=5, "go back");
        _;  // 함수가 실행되는 위치를 의미.
    }

    /*
    function A() public view returns(uint) {
        require(a >=5, "go back");
        return a*5;
    }

    function B() public view returns(uint) {
        require(a>=5, "go back");
        return a**2;
    }
    */

    function setA(uint _n) public {
        a = _n;
    }

    // 위 주석처리 된 함수를 아래처럼 할 수 있음. modifier의 require 실행 후 return이 실행.
    function A() public view higherThanFive returns(uint) {
        // require(a >=5, "go back");
        return a*5;
    }

    function B() public view higherThanFive returns(uint) {
        // require(a>=5, "go back");
        return a**2;
    }

}
