// SPDX-License-Identifier: GPL-3.0

pragma solidity >=0.8.2 <0.9.0;

contract MODIFIER3{
    uint a =1;

    uint b;
    uint c;

    modifier mul1() {
        a *=3;
        _;
    }

    modifier mul2() {
        a +=7;
        _;
    }

    function resetA() public {
        a = 1;
    }

    function setB() public mul1 mul2 {
        b = a;
    }

    function setC() public mul2 mul1 {
        c = a;
    }

    function getBC() public view returns(uint, uint) {
        return (b, c);
    }
}