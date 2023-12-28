// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract MODIFIER2 {
    uint a;
    uint b;

    modifier mul1() {
        a *=2;
        _;
    }

    modifier mul2() {
        _;
        b *=2;
    }


    function getAB() public view returns(uint, uint) {
        return (a, b);
    }

    function A() public mul1 {
        a +=7;
    }

    function B() public mul2 {
        b +=7;
    }
}

contract MODIFIER2_2 {
    uint a=1;
    uint b=1;

    modifier mul1() {
        a *=2;
        _;
        a *=2;
    }

    modifier mul2() {
        _;
        b *=2;
        _;
    }


    function getAB() public view returns(uint, uint) {
        return (a, b);
    }

    function A() public mul1 {
        a +=7;
    }

    function B() public mul2 {
        b +=7;
    }
}