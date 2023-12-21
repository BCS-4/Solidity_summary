// SPDX-License-Identifier: MIt
pragma solidity >=0.8.2 <0.9.0;

contract MAPPING2 {
    // mapping과 구조체를 함께 사용해보기.
    // 예시) A의 이름으로 정보들(숫자, 점수, 집주소 등)을 입력하고 받아오기.

    struct Student {
        uint number;
        uint score;
        string home_address;
    }

    mapping(string => Student) students;

    /* 참고 : struct나 array는 key로서 역할을 못함! (아래 코드 에러)
    mapping(Student => string) students2;
    TypeError: Only elementary types, contract types or enums are allowed as mapping keys.
    */
    // 정보 넣기
    function set_student(string memory _name, uint _number, uint _score, string memory _address) public {
        students[_name] = Student(_number, _score, _address);
    }

    // 정보 넣기2 (이렇게도 가능하겠죠?)
    function set_student2(string memory _name, Student memory _student) public {
        students[_name] = _student;
    }

    // 학생 이름으로 정보 조회하기
    function getStudent(string memory _name) public view returns(Student memory) {
        return students[_name];
    }

}