// SPDX-License-Identifier: MIT

pragma solidity >=0.8.2 <0.9.0;

contract ARRAY_static {
    // 동적 array. 길이가 정해져 있지 않음.
    uint[] numbers;

    // 정적 array. 길이가 정해져 있음.
    uint[6] number;

    /* 그럼 push / pop이 될까? → length가 변하기 때문에 안됨.
    function push(uint _n) public {
        number.push(_n);
    }
    */

    // 아래 함수는 가능함. 배열의 길이가 변경되지 않음.
    function setNumber(uint _n, uint _m) public {
        number[_n - 1] = _m;
    }

    // pop은 가능할까? → 길이가 변경되기 때문에 안됨.
    // 하지만 delete는 가능함. 배열의 길이를 변경하지 않음.
    function deleteNumber(uint _n) public {
        delete number[_n - 1];
    }

    // 초기값 6
    function getLength() public view returns(uint) {
        return number.length;
    }

    // 초기값 : 0, 0, 0, 0, 0, 0
    function returnArray() public view returns(uint[6] memory) {
        return number;
    }
}