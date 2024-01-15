// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.15;

// 상속받아서 배포한 컨트랙트는, 원래의 컨트랙트의 값을 못 따라감. -> 바라보는 주소가 다름.
contract DAD {
    uint a;

    function setA(uint _a) public {
        a = _a;
    }

    function getA() virtual public view returns(uint) {
        return a;
    }

    function who() virtual public pure returns(string memory) {
        return "dad from DAD";
    }

    function name() public pure returns(string memory) {
        return "David";
    }

    function getZ() external pure returns(uint) {
        return 10;
    }
}

contract MOM {
    function who() virtual public pure returns(string memory) {
        return "mom from MOM";
    }
}

contract Child is DAD {
    function who() override public pure returns(string memory) {
        return super.who();
    }

    function fathersName() public pure returns(string memory) {
        return super.name();
    }

    function getA() override public view returns(uint) {
        return super.getA();
    }

    function getA2() public view returns(uint) {
        return super.getA();
    }

    /*function getZ2() public pure returns(uint) {
        return super.getA();
    }*/
}

// 아래 child2~5의 결과값을 보면, is 뒤 상속 마지막으로 입력한 값을 기준으로 super가 적용됨.
contract Child2 is DAD, MOM {
    function who() override(DAD, MOM) public pure returns(string memory) {
        return super.who(); // mom
    }
}
contract Child3 is DAD, MOM {
    function who() override(MOM, DAD) public pure returns(string memory) {
        return super.who(); // mom
    }
}
contract Child4 is MOM, DAD {
    function who() override(DAD, MOM) public pure returns(string memory) {
        return super.who(); // dad
    }
}
contract Child5 is MOM, DAD {
    function who() override(MOM, DAD) public pure returns(string memory) {
        return super.who(); // dad
    }
}