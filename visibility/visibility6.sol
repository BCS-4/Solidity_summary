// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.15;

contract DAD {
    function who() virtual public pure returns(string memory) {
        return "dad from DAD";
    }

    function name() public pure returns(string memory) {
        return "David";
    }
    function getA() external pure returns(uint) {
        return 10;
    }
}

contract MOM {
    function who() virtual public pure returns(string memory) {
        return "mom from MOM";
    }
}

contract Child is DAD {
    // super 키워드는 상속해준 바로 위를 의미함.
    function who() override public pure returns(string memory) {
        return super.who();
    }

    function fathersName() public pure returns(string memory) {
        return super.name();
    }

    /* external은 상속된 컨트랙트에서 사용 못함. external은 컨트랙트 외부에서만!
    function getA2() public pure returns(uint) {
        return super.getA();
    }
    */
}