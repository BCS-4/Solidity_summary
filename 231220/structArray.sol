// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

contract STRUCT_ARRAY {
    // Q. Student 구조체인데, 이름, 번호, 이번학기 수강 수업들이 포함된 구조체를 만들어보세요.
    struct Student {
        string name;
        uint number;
        string[] classes;
    }

    // Q. Student형 students 배열을 만드세요.
    Student[] students;

    Student s1;
    Student s2;
    Student s3;

    function setStudent1(string memory _name, uint _number, string[] memory _classes) public {
        s1 = Student(_name, _number, _classes);
    }
    /* setStudent1 함수에 input값으로 아래처럼 넣어보자. 그럼 모두 실행안됨.
        _name = abc, _number = 1, _classes = a,b,c
        _name = abc, _number = 1, _classes = "a","b","c"
        _name = abc, _number = 1, _classes = [a,b,c]

        배열이면서([]), 문자형("")이기 때문에 아래처럼 값을 입력해야 함.
        abc, 1, ["a", "b", "c"]
    */

    function setStudent2(Student memory _s) public {
        s2 = _s;
    }
    /* setStudent2에서는 input값을 아래와 같이 넣어야 합니다.
        [abc, 1, ["a", "b", "c"]]
    */

    function setStudent3(string memory _name, uint _number, string[] memory _classes) public {
        s3 = Student({
            name : _name,
            number : _number,
            classes : _classes
        });
    }
    /* setStudent3에서는 input 값을 setStudent1과 같이 넣어줘야 합니다.
        abc, 1, ["a", "b", "c"]
    */

    function pushStudent(Student memory _s) public {
        students.push(_s);
    }
    /* pushStudent에서 input 값을 아래와 같이 넣어야 합니다.
        [abc, 1, ["a", "b", "c"]]
    */

    function getStudent() public view returns(Student[] memory) {
        return students;
    }
}