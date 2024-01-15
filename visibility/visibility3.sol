// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.15;

contract DAD {
    function dad() virtual public pure returns(string memory) {
        return "dad";
    }
}

contract MOM {
    function mom() public pure returns(string memory) {
        return "mom";
    }
}

// 복수로 상속 받을 수 있음.
contract Child is DAD, MOM {
    function child() public pure returns(string memory) {
        return "child";
    }

    /* 상속받은 컨트랙트의 함수명과 같으면 안 됨.
    ※ 단, 함수명이 같더라도 input 갯수가 다르면 다른 함수임.
    function dad() public pure returns(string memory) {
        return "dad from CHILD";
    }
    그럼 어떻게 타개해야 되나?
    → 상속되는 함수에 virtual (덮여 쓰여질 준비) / 상속받은 함수에 override
    */

    function dad() override public pure returns(string memory) {
        return "dad from CHILD";
    }

    function mom(uint _a) public pure returns(uint) {
        return _a;
    }
}

// 손자 상속
contract grandChild is Child {
    function grandchild() public pure returns(string memory) {
        return "grand child";
    }
}