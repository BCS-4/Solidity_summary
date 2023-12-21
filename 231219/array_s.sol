// SPDX-License-Identifier: MIT

pragma solidity >=0.8.2 <0.9.0;

contract ARRAY_S {
    string [] letters; // 동적 array : 길이가 정해져 있지 않음.

    // 1. 값 넣기(push) : 앞에서부터 추가
    function push(string memory _a) public {
        letters.push(_a);
    }

    // 전체 반환
    function returnArray() public view returns(string[] memory) {
        return letters;
    }

    // 2. 값 빼기(pop) : 뒤에서부터 빼기
    function pop() public {
        letters.pop();
    }

    // 3. _n번째 값 보기
    function getString(uint _n) public view returns(string memory) {
        return letters[_n - 1];
    }

    // 배열의 길이
    function getLength() public view returns(uint) {
        return letters.length;
    }

    // 4. 값 바꾸기 : _n 번째 값을 _m로 바꾸기
    function setString(uint _n, string memory _m) public {
        letters[_n - 1] = _m;
    }

    // delete : _n번째 숫자를 없애줌.
    // pop과 다른점?
    // legnth가 변하지 않고, 값을 초기값(빈값) 으로 바꿈.
    // 예시 (2번째 값을 delete 하면) : a, ,c, d, e
    function deletString(uint _n) public {
        delete letters[_n - 1];
    }
}