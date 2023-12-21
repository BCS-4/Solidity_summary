// SPDX-License-Identifier: MIt
pragma solidity >=0.8.2 <0.9.0;

contract FOR {
    function loop1() public pure returns(uint) {
        uint a;

        for(uint i=0; i<5; i++) {
            a += i;  // a = a+i 와 같음.
        }

        return a;
    }
    // loop1()의 결과 값은 10. 그럼 i는 몇일까? loop2함수에서 확인해보자.

    function loop2() public pure returns(uint, uint) {
        uint a;
        uint i;

        for(i=1; i<5; i++) {
            a += i;
        }

        return (a, i);
    }
    /* 결과 값 a = 10, i = 5가 나옴.
        이유는? for문을 i=4까지 돌고, i=5 일 때 for문은 은 실행하지 않음.
        즉, i=5로 값이 정해지고, for문에서 조건이 안맞아서 a +=i 실행하지 않음.
    */

    // Q. 1부터 100까지 누적합을 구하는 함수를 구현하세요.
    function loop3() public pure returns(uint) {
        uint a;
        for(uint i = 1; i <=100; i++) {  // i=0으로 해도 0을 더하기 때문에 상관 없음.
            a += i;
        }

        return a;
    }

    // Q. 1부터 100까지 중 홀수들만의 합을 구해보세요.
    function loop4() public pure returns(uint) {
        uint a;
        for(uint i = 1; i<=100; i+=2) {
            a += i;
        }

        return a;
    }

    // Q. 1부터 100까지 중 2의 제곱승의 합만 구해보세요.
    function loop5() public pure returns(uint) {
        uint a;
        for(uint i=1; i <=100; i*=2) {
            a += i;
        }

        return a;
    }
}