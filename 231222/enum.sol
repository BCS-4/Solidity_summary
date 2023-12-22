// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract ENUM {
    // 자동차의 경우를 생각해보자.
    // enum : 한 가지 변수 안에 여러가지 상황을 넣을 수 있음.
    // 개발자한테 가독성이 좋을 수 있고, 결과값이 uint8이라 가벼운 장점이 있음.

    enum Status {
        TurnedOff,
        Stop,
        Moving
    }   // 결과는 uint8 형태임.

    Status CarStatus;   // Status형 CarStatus.

    function getStatus() public view returns(Status) {
        return CarStatus;   // 초기값은 0. 0 = TurnedOff 임.
    }

    function turnOn() public {
        CarStatus = Status.Stop;
    }

    function moving() public {
        CarStatus = Status.Moving;
    }
}

contract ENUM2 {
    /* Q. 색깔이라는 enum 형 변수를 설정하고 white, red, yellow, green 상태를 선언하세요.
        기본은 white 이고 red, yellow, green으로 상태를 변경하는 함수를 각각 구현하세요.
        현재 어떤 상태인지 반환하는 함수도 구현하세요
    */

    enum Color {
        white,
        red,
        yellow,
        green
    }

    Color c;

    function getcolor() public view returns(Color) {
        return c;
    }

    function red() public {
        c = Color.red;
    }
    function yellow() public {
        c = Color.yellow;
    }
    function green() public {
        c = Color.green;
    }
    function white() public {
        c = Color.white;
    }

    // uint 형태로 넣어보자.
    function setColor(uint _n) public {
        c = Color(_n);
    }
    
}

contract ENUM3 {
    enum Status {
        A,
        B,
        C,
        D,
        F
    }

    Status grade;

    function getGrade() public view returns(Status) {
        return grade;
    }

    function setGrade(uint _n) public {
        if(_n >= 90) {
            grade = Status.A;
        } else if(_n >= 80) {
            grade = Status.B;
        } else if(_n >= 70) {
            grade = Status.C;
        } else if(_n >= 60) {
            grade = Status.D;
        } else {
            grade = Status.F;
        }
    }

}