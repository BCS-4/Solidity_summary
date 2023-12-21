// SPDX-License-Identifier: MIT

pragma solidity >=0.8.2 <0.9.0;

contract Array {
    uint[] numbers;  // 자료형 [] array_이름. default 값은 빈값.

    // 1. 값 넣기(push) : 앞에서부터 추가
    function push(uint _a) public {
        numbers.push(_a);
    }

    // 전체 반환
    function returnArray() public view returns(uint[] memory) {
        return numbers;
    }

    // 2. 값 빼기(pop) : 뒤에서부터 빼기
    function pop() public {
        numbers.pop();
    }

    // 3. _n번째 값 보기
    function getNumber(uint _n) public view returns(uint) {
        return numbers[_n - 1];
    }

    // 배열의 길이
    function getLength() public view returns(uint) {
        return numbers.length;
    }

    // 4. 값 바꾸기 : _n 번째 값을 _m로 바꾸기
    function setNumber(uint _n, uint _m) public {
        numbers[_n - 1] = _m;
    }

    // delete : _n번째 숫자를 없애줌.
    // pop과 다른점?
    // legnth가 변하지 않고, 값을 초기값 0 으로 바꿈.
    // 예시 (3번째 값을 delete 하면) : 1, 2, 0, 4, 5
    function deletNumber(uint _n) public {
        delete numbers[_n - 1];
    }
}