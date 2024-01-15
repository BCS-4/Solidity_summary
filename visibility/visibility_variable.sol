// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.15;

contract VISIBILITY_Variable {
    uint a = 1;
    uint private b = 2;
    uint internal c = 3;
    uint public d = 4;

    function getABCD() public view returns(uint, uint, uint, uint) {
        return (a, b, c, d);
    }

    function setA_1() public {
        a = 10;
    }

    function setA_2() external {
        a = 20;
    }

    function setA_3() internal {
        a = 30;
    }

    function setA_4() private {
        a = 40;
    }

    function setB_1() public {
        b = 10;
    }

    function setB_2() external {
        b = 20;
    }

    function setB_3() private {
        b = 30;
    }

    function setB_4() internal {
        b = 40;
    }
}