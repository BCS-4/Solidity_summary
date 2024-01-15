// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.15;

contract DAD {
    function who() virtual public pure returns(string memory) {
        return "dad from DAD";
    }
}

contract MOM {
    function who() virtual public pure returns(string memory) {
        return "mom from MOM";
    }
}

// 서로다른 두 개의 상속받는데, 상속받는 두 함수의 함수명이 같을 경우 override를 해줘야 함.
/*
    1. return 값의 형태를 맞춰줘야 함.
    2. 누구를 override할 건지 명확히.
*/
contract Child is DAD, MOM {
    function who() override(DAD, MOM) public pure returns(string memory) {
        return DAD.who();
    }
}
