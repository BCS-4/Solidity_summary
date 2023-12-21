// SPDX-License-Identifier: MIt
pragma solidity >=0.8.2 <0.9.0;

contract IF {
    // 00점 이상일 경우 x학점을 부여하는 함수를 만들어보자.
    function grade(uint _score) public pure returns(string memory) {
        if(_score >= 90) {
            return "A";
        } else if(_score >= 80) {
            return "B";
        } else if(_score >= 70) {
            return "C";
        } else {
            return "F";
        }
    }

    /* Q. 2로 나누어 떨어지면 A, 2로는 안 나누어 떨어지고 3으로 나누어 떨어지면 B,
    2와 3으로는 안 나누어 떨어지고 5로 나누어 떨어지면 C를 반환하세요.
    */
    function example(uint _number) public pure returns(string memory) {
        if(_number % 2 == 0) {
            return "A";
        } else if(_number % 3 == 0) {
            return "B";
        } else if(_number % 5 == 0) {
            return "C";
        } else {
            return "ETC";
        }
    }

    /* Q. 20이상 40이하 사이의 숫자는 아니면서 2로 나누어 떨어지면 A
        20이상 40이하 사이의 숫자인데 2로 나누어 떨어지면 B
        20이상 40이하 사이의 숫자인데 홀수면 C
        나머지는 D

        and 연산자 : &&
        or 연산자 : ||
    */
    function example2(uint _number) public pure returns(string memory) {
        if(_number%2==0 && _number >40 || _number <20) {
            return "A";
        } else if(_number <=40 && _number >=20 && _number%2==0) {
            return "B";
        } else if(_number <=40 && _number >=20 && _number%2!=0) {
            return "C";
        } else {
            return "D";
        }
    }
}