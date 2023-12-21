// SPDX-License-Identifier: MIt
pragma solidity >=0.8.2 <0.9.0;

contract MAPPING5 {
    // 구조체가 value 값으로 들어가는 경우
    struct Student {
        string name;
        uint number;
    }

    mapping(string => Student) students;    // 담당 교사 (1:1)
    mapping(string => Student[]) students2;     // 반 담임 교사 (1:다)

    // _teacher는 _s1의 담당 교사로 설정.
    function setTeacherStudent(string memory _teacher, Student memory _s1) public {
        students[_teacher] = _s1;
    }

    // _teacher의 반 학생에 _s2 학생을 추가.
    function setTeacherStudent2(string memory _teacher, Student memory _s2) public {
        students2[_teacher].push(_s2);
    }

    // _teacher가 담당하는 학생 (한 명)
    function getStudent1(string memory _teacher) public view returns(Student memory) {
        return students[_teacher];
    }

    // teacher가 담당하는 학생 들
    function getStudents2(string memory _teacher) public view returns(Student[] memory) {
        return students2[_teacher];
    }

}