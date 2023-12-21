// SPDX-License-Identifier: MIT
pragma solidity >=0.8.2 <0.9.0;

contract QUIZ {
     /*
    이름, 번호, 점수, 학점(string)을 포함하는 구조체 student를 만들고
    student 들이 들어갈 수 있는 array class를 구현하시오.

    class에 학생을 넣기, n번째 학생의 전체정보 반환, n번째 학생의 점수 반환, class 내 학생 수 반환하는 함수를 구현하세요.
    */

    // 이름, 번호, 점수, 학점(string)을 포함하는 구조체 student를 만들기
    struct student {
        string name;
        uint number;
        uint score;
        string grade;
    }

    // student형 array class.
    student[] class;

    // class에 학생 넣기
    function pushStudent(string memory _name, uint _number, uint _score, string memory _grade) public {
        class.push(student(_name, _number, _score, _grade));
    }

    // n번째 학생의 전체 정보 반환
    function getStudent(uint _n) public view returns(student memory) {
        return class[_n-1];
    }

    // n번째 학생의 점수 반환
    function getScore(uint _n) public view returns(uint) {
        return class[_n-1].score;
    }

    // class 내 학생 수 반환
    function getLength() public view returns(uint) {
        return class.length;
    }

    /* returns(student memory)를 보면 student memory 형태로 반환하니까
    student 구조체의 input값이 많아진다면 구조체로 표현할 수 있지 않을까?
    위의 pushStuent 함수와 비교해보세요.
    */

    function pushStudent2(student memory _s) public {
        class.push(_s);
    }
    /* 이때, _s에는 4개의 값이 들어가야 합니다. 넣는 방법은 아래와 같습니다.
    ["a", 1, 90, "b"] 
    */
    
}