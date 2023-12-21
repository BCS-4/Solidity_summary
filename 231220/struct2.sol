// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

contract STRUCT2 {
    // Q. 이름, 성별, 숫자를 포함한 구조체를 만드세요.
    struct Student {
        string name;
        bool isMale;
        uint number;
    }

    // Q. Student형 배열은 선언하세요.
    Student[] class;

    // Q. Student형 배열인 class에 값을 추가하는 함수를 만드세요.
    function pushStudent(string memory _name, bool _isMale, uint _number) public {
        class.push(Student(_name, _isMale, _number));
    }

    // Q. class를 전체 반환하는 함수를 만드세요. 
    function getClass() public view returns(Student[] memory) {
        return class;
    }

    // Q. class의 n번째 값을 반환하는 함수를 만드세요.
    function getStudent(uint _n) public view returns(Student memory) {
        return class[_n-1];
    }

}