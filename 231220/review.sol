// SPDX-License-Identifier: MIT

pragma solidity >=0.8.2 <0.9.0;

contract REVIEW {
    // Q. 숫자형 a를 선언하세요.
    uint a;
    // Q. 문자형 b를 선언하세요.
    string b;
    // Q. bytes형 c를 선언하세요.
    bytes c;

    // Q. 숫자형 동적 배열을 만드세요.
    uint[] numbers;

    // Q. 문자형 동적 배열을 만드세요.
    string[] letters;

    // Q. bytes형 동적 배열을 만드세요.
    bytes[] array;

    // Q. 3개의 숫자를 더하는 함수를 만드세요.
    function add(uint _a, uint _b, uint _c) public pure returns(uint) {
        return _a + _b + _c;
    }

    // Q. 3개의 숫자를 곱하는 함수를 만드세요.
    function mul(uint _a, uint _b, uint _c) public pure returns(uint) {
        return _a * _b * _c;
    }

    // Q. 숫자형 동적 배열에 숫자를 추가하는 함수를 만드세요.
    function push_Number(uint _n) public {
        numbers.push(_n);
    }

    // Q. 문자형 동적 배열에 문자를 추가하는 함수를 만드세요.
    function push_String(string memory _s) public {
        letters.push(_s);
    } 

    // Q. 숫자를 빼는 함수를 만드세요.
    function pop_Number() public {
        numbers.pop();
    }

    // Q. 숫자형 배열에서 n번째 값을 확인하는 함수를 만드세요.
    function getNumber(uint _n) public view returns(uint) {
        return numbers[_n-1];
    }

    // Q. 숫자형 배열에서 n번째 값을 _a로 변경하는 함수를 만드세요.
    function setNumber(uint _n, uint _a) public {
        numbers[_n-1] = _a;
    }

    // Q. 숫자형 배열에서 _n 번째 값을 자료형 초기값(default)으로 변경하는 함수를 만드세요.
    function deleteNumber(uint _n) public {
        delete numbers[_n-1];
    }

    // Q. 숫자형 배열의 길이를 구하는 함수를 만드세요.
    function getLength() public view returns(uint) {
        return numbers.length;
    }

    // Q. 문자형 배열 전체를 반환하는 함수를 구하세요.
    function getArray() public view returns(string[] memory) {
        return letters;
    }

    // Q. push / pop / delete의 차이점을 설명하세요.
    // Q. 숫자형 / 문자형 / bytes형 초기값(default)은?
}