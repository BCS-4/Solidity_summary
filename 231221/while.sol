// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract WHILE {
    uint STATE = 1;

    // while_1 함수에서 _n = 5 일경우 STATE와 a 의 값은 어떻게 될까요?
    function while_1(uint _n) public returns(uint, uint) {
        uint a;

        while(_n > a) {
            STATE *= 2;
            a++;
        }

        return (STATE, a);
    }

    // numbers 라는 array 안에 _n 개의 짝수가 들어가는 식을 while을 이용하여 구현하세요.
    uint[] numbers;
    function while_2(uint _n) public returns(uint[] memory) {
        while(numbers.length < _n) {
            numbers.push((numbers.length + 1) * 2);
        }
        return numbers;
    }

    /* 특정 숫자의 자릿수를 알아내는 방법을  while을 이용하여 구현해보세요 
        예시) 12345 -> 5자리, 5492 -> 4자리
        (while_3, while_4 함수처럼 여러 방식 가능함)
    */
    function while_3(uint _n) public pure returns(uint) {
        uint a = 1;
        while(_n >= 10 ** a) {
            a++;
        }
        return a;
    }

    function while_4(uint _n) public pure returns(uint) {
        uint a;
        while(_n > 0) {
            _n /= 10;
            a++;
        }
        return a;
    }

}