// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

contract IF2 {
    // 40 ~ 60 사이 혹은 100 ~ 150 혹은 5의 배우인 경우 A, 3의 배수이면 B, 아니면 C 인 함수를 만드세요.
    function Numbers(uint _number) public pure returns(string memory) {
        if(_number >= 40 && _number <= 60 || _number >= 100 && _number <= 150 || _number%5 == 0) {
            return "A";}
         else if(_number % 3 == 0) {
            return "B";
        } else {
            return "C";
        }
    }
}

/* 40 ~ 60 사이거나 2로 나누어 떨어지는 경우
    _number >= 40 && _number <=60 || _number%2 == 0
  */

/* 40 ~ 60 이거나 2의 배수이거나 3의 배수일 경우
    _number >= 40 && _number <= 60 || _number%2 == 0 || _number%3 == 0
*/
