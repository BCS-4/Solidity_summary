// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

contract STRUCT3 {
    struct Student {
        string name;
        uint number;
    }

    Student[] class;

    Student s1;
    Student s2;
    Student s3;

    // Student 구조체의 값을 변경 하는 방법은 다양함.
    function setStudent1(string memory _name, uint _number) public {
        s1 = Student(_name, _number);
    }

    function setStudent2(string memory _name, uint _number) public {
        s2.name = _name;
        s2.number = _number;
    }

    function setStudent3(string memory _name, uint _number) public {
        s3 = Student({
            name : _name,
            number : _number
        });
    }

    // s1, s2, s3 반환
    function getStudent() public view returns(Student memory, Student memory, Student memory) {
        return (s1, s2, s3);
    }

}