// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.15;

contract A {
    uint public a;
    uint public b;

    constructor(uint _a, uint _b) {
        a = _a;
        b = _b;
    }
}

contract B is A(4, 10) {
    // ....
}

contract C {
    A a = new A(5, 10);
    A b;

    function setB(uint _a, uint _b) public {
        b = new A(_a, _b);
    }
}