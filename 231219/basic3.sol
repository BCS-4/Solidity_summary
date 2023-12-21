// SPDX-License-Identifier: MIT

pragma solidity >=0.8.2 <0.9.0;

// view(상태변수) pure(지역변수)
// 상태변수를 읽어오는 건 돈 안듬. 무거울 뿐. (view)
// 지역변수 / 상태변수 읽어오는 것 중에 더 쉬운건? 지역변수임.
// 단, 지역변수는 함수가 끝나면 휘발되서 사라짐.
// 상태변수를 참조하면 view. 상태변수 전혀 사용하지 않으면 pure.

contract basic3 {
    uint a;  // 상태변수

    function setA(uint _a) public {
        a = _a;
    }

    /*
    상태변수를 변경 할 때, view / pure 사용하지 않음. (아래 코드 에러)
    function setA(uint _a) public view {
        a = _a;
    }
    */


    function getA() public view returns(uint) {
        return a;
    }

    function getB(uint _a) public pure returns(uint) {
        uint _b = _a ** 3;  // 함수 안에서 선언이기 때문에, 지역변수임.
        return (_a + _b);
    }

    /*
    이 함수는 오류가 발생함. 이유는 상태변수인 a를 가져와야 하기 때문에 pure → view로 변경해야 함. 
    function getAPlusB(uint _b) public pure returns(uint) {
        return a + _b;
    }
    */

    function getAPlusB(uint _b) public view returns(uint) {
        return a + _b;
    }
}