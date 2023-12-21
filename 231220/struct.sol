// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

contract STRUCT {
    // 서로다른 자료형들을 하나로 묶어서 사용 할 때 struct.
    // 변수가 아닌 변수 형태임!!
    struct Student {
        string name;
        bool isMale;
        uint number;
    }

    // Q. Student형 변수 s. 
    Student s;
    // ※ Student형은 값을 부여 할 때, 3가지 형태가 필요함(string / bool / uint). 

    // Q. Student형 s의 값을 설정하는 함수를 만드세요.
    function setS(string memory _name, bool _isMale, uint _number) public {
        s = Student(_name, _isMale, _number);
    }

    // Q. Student형 s의 값을 불러오는 함수를 만드세요.
    function getS() public view returns(Student memory) {
        return s;
    }

    // Q. Student형 s의 이름만 가져오는 함수를 만드세요.
    function getName() public view returns(string memory) {
        return s.name;
    }

    // Q. s의 번호를 가져오는 함수를 만드세요.
    function getNumber() public view returns(uint) {
        return s.number;
    }

    /* Q. 이름, 번호, 점수, 학점, 2명의 학생을 만들고
    2명의 학생에 각각 정보를 넣고 받아오는 함수를 만드세요*/
    // 구조체 만들기
    struct STUDENT {
        string name;
        uint number;
        uint score;
        string grade;
    }
    // 학생 2명
    STUDENT s1;
    STUDENT s2;

    // 정보 넣기
    function setS1(string memory _name, uint _number, uint _score, string memory _grade) public {
        s1 = STUDENT(_name, _number, _score, _grade);
    }
    function setS2(string memory _name, uint _number, uint _score, string memory _grade) public {
        s2 = STUDENT(_name, _number, _score, _grade);
    }
    // 정보 받아오기
    function getS1() public view returns(STUDENT memory) {
        return s1;
    }
    function getS2() public view returns(STUDENT memory) {
        return s2;
    }
}