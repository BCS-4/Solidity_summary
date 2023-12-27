// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.15;

/*
학생 점수관리 프로그램입니다.
여러분은 한 학급을 맡았습니다.
학생은 번호, 이름, 점수로 구성되어 있고(구조체)
가장 점수가 낮은 사람을 집중관리하려고 합니다.

가장 점수가 낮은 사람의 정보를 보여주는 기능,
총 점수 합계, 총 점수 평균을 보여주는 기능,
특정 학생을 반환하는 기능, -> 숫자로 반환
가능하다면 학생 전체를 반환하는 기능을 구현하세요. ([] <- array)
*/

contract Q2 {
    struct Student {
        uint number;
        string name;
        uint score;
    }

    Student[] students;

    function pushStudent(Student memory _s) public {
        students.push(_s);
    }

    function getSum() public view returns(uint, uint) {
        uint sum;
        for(uint i=0; i<students.length; i++) {
            sum += students[i].score;
        }

        return (sum, sum/students.length);
    }

    function getStudent(uint _n) public view returns(Student memory) {
        return students[_n-1];
    }

    function getAllStudents() public view returns(Student[] memory) {
        return students;
    }

    // 허유라
    function getLowest1() public view returns(Student memory) {
        Student memory Lowest = students[0];

        for(uint i=1; i<students.length; i++) {
            if(Lowest.score > students[i].score) {
                Lowest = students[i];
            }
        }

        return Lowest;
    }

    // 최세창
    function getLowest2() public view returns(Student memory) {
        uint _low = 100;
        uint _idx;

        for(uint i = 0; i < students.length; i++) {
            if(_low > students[i].score) {
                _low = students[i].score;
                _idx = i;
            }
        }

        return students[_idx];
    }

    // 김재현
    function getLowest3() public view returns(uint) {
        Student[] memory _students = students;
        for(uint i=0; i<_students.length; i++){
            for(uint j=i+1; j<_students.length; j++){
                if(_students[i].score < _students[j].score){
                    (_students[i], _students[j]) = (_students[j],_students[i]);
                }

            }
        }
        return students[0].score;
    }
}