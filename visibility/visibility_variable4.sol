// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.15;

contract DAD {
    uint public a;
    uint[] public b;

    function getAddress() public view returns(address) {
        return address(this);
    }

    function setA(uint _n) public {
        a = _n;
    }

    function setB(uint[] memory _b) public {
        b = _b;
    }
}

contract MOM {
    DAD public husband = new DAD();

    function setHusband(address _a) public {
        husband = DAD(_a);
    }

    function getA() public view returns(uint) {
        return husband.a();
    }

    function getB(uint _n) public view returns(uint) {
        return husband.b(_n);
    }

    function setA() public {
        husband.setA(999);
    }
}