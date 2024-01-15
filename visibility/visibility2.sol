// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.15;

contract VISIBILITY {
    uint a =5;
    uint b =7;
    uint c =9;
    uint d =11;

    function privateF() private view returns(uint) {
        return a;
    }

    function testPrivateF() public view returns(uint) {
        return privateF();
    }

    function internalF() internal view returns(uint) {
        return b;
    }

    function testInternalF() public view returns(uint) {
        return internalF();
    }

    function publicF() public view returns(uint) {
        return c;
    }

    function externalF() external view returns(uint) {
        return d;
    }

    function setA(uint _a) public {
        a = _a;
    }

    function setB(uint _b) public {
        b = _b;
    }

    function setC(uint _c) public {
        c = _c;
    }

    function setD(uint _d) public {
        d = _d;
    }
}

contract Child is VISIBILITY {
    // 배포 후, 값을 확인해보면 VISIBILITY의 5, 7, 9, 11 값을 가져옴.
    // VISIBILITY 컨트랙트에서 a,b,c,d 값을 변경 후, Child에서 다시 불러오면 변경된 값을 불러오지 않음.
    // 즉, 상속은 컨트랙트 껍데기만 빌려오는 것!
    function internal_C() public view returns(uint) {
        return internalF();
    }

    function public_C() public view returns(uint) {
        return publicF();
    }

    function private_C() public view returns(uint) {
        return testPrivateF();
    }

}

contract Outsier {
    // VISIBILITY 형 vs
    VISIBILITY vs = new VISIBILITY();

    function publicF_o() public view returns(uint) {
        return vs.publicF();
    }

    function externalF_o() public view returns(uint) {
        return vs.externalF();
    }
}